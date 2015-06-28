require 'csv'
require_relative 'project'
require_relative 'funding_round'

class FundRequest
	attr_reader :title

	def initialize(title)
		@title = title
		@projects = []
	end

	def add_projects(from_file)
		CSV.foreach(from_file) do |name, target, funds|
			add_project(Project.new(name, target.to_i, funds.to_i))
		end
	end

	def add_project(project)
		@projects << project
	end

	def print_funding_stats
		funded, not_funded = @projects.partition { |p| p.funded? }
		puts "#{@title}'s Status:"

		puts "\n#{funded.length} Projects Fully-Funded:"
		funded.each do |project|
			puts formated_funding(project)
		end

		puts "\n#{not_funded.length} Projects Under-Funded:"
		not_funded.each do |project|
			puts formated_funding(project)
		end
	end

	def outstanding_projects
		@projects.reject { |p| p.funded? }
	end

	def formated_funding(project)
    "#{project.name.ljust(20, ".")} $#{project.funds}" 
	end

	def save_outstanding(to_file)
		File.open(to_file, 'w') do |file|
			outstanding_projects.each do |project|
				file.puts formated_funding(project)
			end
		end
	end

	def print_outstanding
		puts "\nProjects With Outstanding Funds:"
		outstanding_projects.each do |project|
			puts formated_funding(project)
		end
	end

	def print_pledge_amounts
		@projects.each do |project|
      puts "\nProject #{project.name}'s pledges:"
      project.each_pledge { |name, amount| puts "$#{amount} in #{name} pledges" }
    end
	end

	def request_funding(rounds)
		puts "There are #{@projects.length} in #{@title}:"
		PledgePool.print_possible_pledges
		puts @projects
		1.upto(rounds).each do |round|
			puts "\nFunding round #{round}:"
			@projects.each do |project|
				FundingRound.update_funding(project)
      end
		end

		print_pledge_amounts

		puts "\nFinal Projects Funding:"
		puts @projects
	end
end


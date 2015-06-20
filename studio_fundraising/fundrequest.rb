require_relative 'project'

class FundRequest
	attr_reader :title

	def initialize(title)
		@title = title
		@projects = []
	end

	def add_project(project)
		@projects << project
	end

	def request_funding
		puts "There are #{@projects.length} in #{@title}:"
		puts @projects
		@projects.each do |project|
			project.remove
			project.remove
			project.add
		end
		puts @projects
	end
end


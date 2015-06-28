require_relative 'die'
require_relative 'pledge_pool'

module FundingRound
	def self.update_funding(project)
		die = Die.new

		if die.roll % 2 == 0
			project.add
		else
			project.remove
		end

		pledge = PledgePool.random
		puts "#{project.name} received a #{pledge.name} pledge worth $#{pledge.amount}."
		project.add_pledge(pledge)
    puts "Project #{project.name}'s pledges: #{project.pledges}"
	end
end

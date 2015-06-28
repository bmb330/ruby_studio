Pledge = Struct.new(:name, :amount)

module PledgePool
	PLEDGES = [
		Pledge.new(:bronze, 50),
		Pledge.new(:silver, 75),
		Pledge.new(:gold, 100)
	]

	def self.random
		PLEDGES.sample
	end

	def self.print_possible_pledges
		puts "\nThere are #{PLEDGES.size} possible pledge amounts:"
		PLEDGES.each do |pledge|
			puts "A #{pledge.name} pledge is worth $#{pledge.amount}."
		end
	end
end

if __FILE__ == $0
	PledgePool.print_possible_pledges
end

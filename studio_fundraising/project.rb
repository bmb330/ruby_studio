class Project
	attr_accessor :name
	attr_reader :funds, :target

	def initialize(name, init_fund, target_fund)
		@name = name.capitalize
		@funds = init_fund
		@target = target_fund
	end

	def needed
		@target - @funds
	end

	def add
		@funds += 25
		puts "Project #{@name} got more funds!"
	end

	def remove
		@funds -= 15
		puts "Project #{@name} lost some funds!"
	end

	def to_s
		"Project #{@name} has $#{@funds} in funding towards a goal of $#{@target}."
	end
end


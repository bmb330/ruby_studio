require_relative 'fundable'

class Project
	include Fundable

	attr_accessor :name, :pledges, :funds
	attr_reader :target

	def initialize(name, target_fund, init_fund=0)
		@name = name.capitalize
		@funds = init_fund
		@pledges = Hash.new(0)
		@target = target_fund
  end

  def add_pledge(pledge)
    @pledges[pledge.name] += pledge.amount
		add_funds(pledge.amount)
  end

  def each_pledge
    @pledges.each { |name, amount| yield(name, amount) }
  end

		def to_s
		"Project #{@name} has $#{@funds} in funding towards a goal of $#{@target}."
	end
end


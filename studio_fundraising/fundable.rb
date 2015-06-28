module Fundable
	def needed
		self.target  - self.funds
	end

	def funded?
		self.needed <= 0
	end

	def add
		self.add_funds(25)
		puts "Project #{self.name} got more funds!"
	end

	def remove
		self.funds -= 15
		puts "Project #{self.name} lost some funds!"
	end

	def <=>(other)
		self.needed <=> other.needed
	end

  def add_funds(amount)
		self.funds += amount
	end
end

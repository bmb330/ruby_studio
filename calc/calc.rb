class Calculator
	def initialize(num1, num2)
		@num1 = num1
		@num2 = num2
	end

	def add
		@num1 + @num2
	end

	def subtract
		@num1 - @num2
	end
end

calc = Calculator.new(20, 11)
puts calc.add
puts calc.subtract

def three_times
	puts "Ready"
	yield(1)
	puts "Set"
	yield 2
	puts "After yield"
	yield 3
end

three_times { |number| puts number * 2 }

def compute
	if block_given?
		puts yield
	else
		puts "Does not compute"
	end
end

compute do
	"Hello"
	7
	3.14
end

compute

numbers = (1..10).to_a
puts numbers.select { |n| n.even? }

def my_select(array)
	results = []
	array.each do |element|
		results << element if yield(element)
	end
	results
end

puts my_select(numbers) { |n| n.even? }

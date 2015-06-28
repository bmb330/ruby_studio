require_relative 'project'

class GrantProject < Project
	def remove
		puts "Project #{@name} has recieved no additional funds!"
	end
end

if __FILE__ == $0
	project = GrantProject.new("ABC", 500)
	project.add
	project.remove
	puts project.funds
end

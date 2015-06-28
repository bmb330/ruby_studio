require_relative 'fundrequest'

projects = FundRequest.new("VC-Friendly Start-up Projects")
projects.add_projects(ARGV.shift || 'projects.csv')
loop do
	puts "\nHow many rounds? (Enter 'quit' to exit):"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		projects.request_funding(answer.to_i)
	when 'quit', 'q', 'exit', 'e'
		projects.print_funding_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end
end
projects.print_outstanding
projects.save_outstanding('projects_outstanding.txt')

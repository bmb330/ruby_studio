require 'csv'
require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
	class Game
		attr_reader :title

		def initialize(title)
			@title = title.capitalize
			@players = []
		end

		def save_high_scores(to_file)
			File.open(to_file, "w") do |file|
				file.puts "#{@title} High Scores:"
				@players.sort.each { |player| file.puts score_stat(player) }
			end
		end

		def add_player(player)
			@players << player
		end

		def load_players(from_file)
			CSV.foreach(from_file).each do |row|
				add_player(Player.new(row[0], row[1].to_i))
			end
		end

		def print_name_and_health(player)
			puts "#{player.name} (#{player.health})"
		end

		def score_stat(player)
			"#{player.name.ljust(20, '.')} #{player.score}"
		end

		def total_points
			@players.reduce(0) { |total, p| p.points + total }
		end

		def print_stats
			strong_players, wimpy_players = @players.partition { |p| p.strong? }
			puts "#{@title} Statistics:"
			puts "\n#{strong_players.length} strong players:"
			strong_players.each do |player|
				print_name_and_health(player)
			end

			puts "\n#{wimpy_players.length} wimpy players:"
			wimpy_players.each do |player|
				print_name_and_health(player)
			end

			@players.each do |p|
				puts "#{p.name}'s point totals:"
				p.each_found_treasure do |treasure|
					puts "#{treasure.points} total #{treasure.name} points"
				end
				puts "#{p.points} grand total points"
			end
			puts "#{total_points} total points from treasure found"

			puts "\n#{@title} High Scores:"
			@players.sort.each do |player|
				puts score_stat(player)
			end

		end

		def play(rounds)
			puts "\nThere are #{@players.length} players in #{@title}:"
			puts @players

			treasures = TreasureTrove::TREASURES
			puts "\nThere are #{treasures.size} treasures to be found:"
			treasures.each do |treasure|
				puts "A #{treasure.name} is worth #{treasure.points} points."
			end

			1.upto(rounds).each do |round|
				if block_given?
					break if yield
				end
				puts "\nRound #{round}:"
				@players.each do |player|
					GameTurn.take_turn(player)
					puts player
				end
			end
		end
	end
end

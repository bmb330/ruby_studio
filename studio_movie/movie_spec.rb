require_relative 'movie'

describe Movie do

	before do
		@initial_rank = 10
		@movie = Movie.new("goonies", @initial_rank)
	end

	it "has a capitalized title" do
		expect(@movie.title).to eq("Goonies")
	end

	it "has an initial rank" do
		expect(@movie.rank).to eq(10)
	end

	it "has a string representation" do
		expect(@movie.to_s).to eq("Goonies has a rank of #{@initial_rank}")
	end

	it "increased rank by 1 when given a thumbs up" do
		@movie.thumbs_up
		expect(@movie.rank).to eq(@initial_rank + 1)
	end

	it "decreases rank by 1 when given a thumbs down" do
		@movie.thumbs_down
		expect(@movie.rank).to eq(@initial_rank - 1)
	end

	context "created with a default rank" do
		before do
			@movie = Movie.new("goonies")
		end

		it "has a rank of 0" do
			expect(@movie.rank).to eq(0)
		end
	end
end

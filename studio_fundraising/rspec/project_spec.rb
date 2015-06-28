require_relative '../project'

describe Project do
	before do
		$stdout = StringIO.new
		@initial_name = "test fund"
		@initial_fund = 100
		@initial_target = 500
		@project = Project.new(@initial_name, @initial_target, @initial_fund)
	end

	it "has an initial target funding ammount" do
		expect(@project.target).to eq(@initial_target)
	end

	it "computes the total funding outstanding as the target funding amount minus the funding amount" do
		expect(@project.needed).to eq(@initial_target - @initial_fund)
	end

	it "increases funds by 25 when funds are added" do
		@project.add
		expect(@project.funds).to eq(@initial_fund + 25)
	end

	it "decreases funds by 15 when funds are removed" do
		@project.remove
		expect(@project.funds).to eq(@initial_fund - 15)
	end

	context "created without a funding amount" do
		before do
			@project = Project.new("test project", 500)
		end

		it "has a default value of 0 for funding amount" do
			expect(@project.funds).to eq(0)
		end
	end

	context "created with funding exceeding target amount" do
		before do
			@project = Project.new("test project", 500, 500)
		end

		it "has reached funding" do
			expect(@project).to be_funded
		end
	end

	context "created with target exceeding funding amount" do
		before do
			@project = Project.new("test project", 500, 25)
		end

		it "has not reached funding" do
			expect(@project).not_to be_funded
		end
	end
end

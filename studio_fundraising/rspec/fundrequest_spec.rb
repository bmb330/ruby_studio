require_relative '../fundrequest.rb'

describe FundRequest do
	before do
		@initial_funding = 500
		@project = Project.new("ABC", 10000, @initial_funding)
		@fund_requests = FundRequest.new("test projects")
		@fund_requests.add_project(@project)
		@rounds = 2
	end

	it "add funds to project if number even" do
		allow_any_instance_of(Die).to receive(:roll).and_return(2)
		puts @project
		@fund_requests.request_funding(@rounds)
		expect(@project.funds).to eq(@initial_funding + 25 * 2)
	end

	it "remove funds from project if number is odd" do
		allow_any_instance_of(Die).to receive(:roll).and_return(1)
		@fund_requests.request_funding(@rounds)
		expect(@project.funds).to eq(@initial_funding - 15 * 2)
	end

	context "initially fully funded" do
		before do
			@initial_funding = 10000
			@project = Project.new("ABC", 500, @initial_funding)
			@fund_requests = FundRequest.new("test projects")
			@fund_requests.add_project(@project)
		end

		it "has reached funding goal"
	end			
end

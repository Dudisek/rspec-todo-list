require "rspec"

require_relative "list"

describe List do
  let(:title) {"List of languages"}
 	let(:tasks) { [Task.new("css"), Task.new("html"), Task.new("javascript")] }
  let(:list) { List.new(title, tasks) }

  describe "#initialize" do
  	context "with invalid input" do 
  		it "raise argument error" do
  		expect {Task.new}.to raise_error (ArgumentError)
  		end
  	end

  	context "with valid input" do
  		it "should create a new list" do
  		expect(list).to be_an_instance_of List
  		expect(list.tasks).to match_array(tasks)
  		end
  	end
  end

  describe "#add_task" do
  	context "with invalid input" do
  		it "raises error if no argument" do
  			expect{list.add_task}.to raise_error (ArgumentError)
  		end
  	end

  	context "with valid input" do
  		it "add task to tasks" do
  			list.add_task("hello")
  			expect(tasks[3]).to eq "hello"
  		end
  	end
	end

	describe "#complete_task" do
		context "with invalid input" do
			it "raise argument error" do
				expect{list.complete_task}.to raise_error (ArgumentError)
				expect(list.complete_task(5)).to be false
				expect{list.complete_task("hello")}.to raise_error (TypeError)
			end
		end

		context "with valid input" do
			it "will return true" do 
			expect(list.complete_task(2)).to be true
			end
		end

	end

	describe "#delete_task" do
		context "with invalid input" do
			it "raise argument error" do
			expect{list.delete_task}.to raise_error (ArgumentError)
			expect(list.delete_task(5)).to be false
			expect{list.delete_task("hello")}.to raise_error (TypeError)
			end
		end
		context "with valid input" do
			it "should delete tasks" do
			expect(list.tasks.length).to eq 3	
			list.delete_task(0)
			expect(list.tasks.length).to eq 2
			end
		end
	end

	describe "#completed_tasks" do
		it "should return list of complete tasks" do
			expect(list.completed_tasks.length).to eq 0
			list.complete_task(0)
			list.complete_task(1)
			expect(list.completed_tasks.length).to eq 2
		end

	end

	describe "#incomplete_tasks" do 
		it "should return list of incomplete tasks" do
			expect(list.incomplete_tasks.length).to eq 3
			list.complete_task(0)
			expect(list.incomplete_tasks.length).to eq 2
		end
	end 
end
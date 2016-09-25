require 'spec_helper'

describe Event, type: :model do
	before do
		@event = Event.new(name: "Call mom at noon")
	end

	# Declare the subject once and access it implicitly in one-liners
	subject { @event }

	# Is target object responds?
	it { should respond_to(:name) }

	# Runs all the validations
	it { should be_valid }

	describe "when name is not present" do
		before { @event.name = " " }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			event_with_same_name = @event.dup
			event_with_same_name.save
		end

		# Duplicate event name is ok
		it { should be_valid }
	end
end

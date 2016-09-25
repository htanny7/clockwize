require 'spec_helper'

describe User, type: :model do
	before do
		@user = User.new(email: "john@smith.com")
	end

	# Declare the subject once and access it implicitly in one-liners
	subject { @user }

	# Is target object responds?
	it { should respond_to(:email) }

	# Runs all the validations
	it { should be_valid }

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	it "when email is not valid" do
		user = User.new(email: "john.smith")
		expect(user).not_to be_valid
	end

	describe "when email is already taken" do
		before do
			user_with_same_name = @user.dup
			user_with_same_name.email = @user.email.upcase
			user_with_same_name.save
		end

		# Duplicate user email breaks validation rules
		it { should_not be_valid }
	end
end

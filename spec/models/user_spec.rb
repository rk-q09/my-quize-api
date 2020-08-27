require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "is valid with a username, email, password, and password confirmation" do
    user.valid?
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = build(:user, user_name: nil) 
    user.valid?
    expect(user.errors[:user_name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    user.save
    other_user = build(:user)
    other_user.valid?
    expect(other_user.errors[:email]).to include("has already been taken")
  end

  it "is invalid with a username that has more than 10 characters" do
    user = build(:user, user_name: "invalidusername")
    user.valid?
    expect(user.errors[:user_name]).to include("is too long (maximum is 10 characters)")
  end

  it "is invalid with a password that has less than 8 characters" do
    user = build(:user, password: "passwor")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end

  it "is invalid with a password that has more than 12 characters" do
    user = build(:user, password: "invalidpassword")
    user.valid?
    expect(user.errors[:password]).to include("is too long (maximum is 12 characters)")
  end
end

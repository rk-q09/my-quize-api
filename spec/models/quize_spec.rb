require 'rails_helper'

RSpec.describe Quize, type: :model do
  let(:user) { create(:user) }
  
  it "is invalid without a title" do
    quize = user.quizes.build(title: nil)
    quize.valid?
    expect(quize.errors[:title]).to include("can't be blank")
  end

  it "is invalid with a title that has more than 20 characters" do
    quize = user.quizes.build(title: "toomanycharactersisnotallowed")
    quize.valid?
    expect(quize.errors[:title]).to include("is too long (maximum is 20 characters)")
  end
end

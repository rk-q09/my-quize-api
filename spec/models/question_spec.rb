require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { create(:user) }

  before do
      @quize = user.quizes.create(title: "Test")
  end
  
  it "is invalid without a title" do
    question = @quize.questions.build(content: nil)
    question.valid?
    expect(question.errors[:content]).to include("can't be blank")
  end

  it "is invalid with a content that has more than 30 characters" do
    question = @quize.questions.build(content: "question content can't be more than 30 characters")
    question.valid?
    expect(question.errors[:content]).to include("is too long (maximum is 30 characters)")
  end
end

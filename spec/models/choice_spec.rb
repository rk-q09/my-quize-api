require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { create(:user) }

  before do
      @quize = user.quizes.create(title: "Test")
      @question = @quize.questions.create(content: "1 + 1 = ?")
  end

  it "is invalid without a content" do
      choice = @question.choices.build(content: nil)
      choice.valid?
      expect(choice.errors[:content]).to include("can't be blank")
  end
end

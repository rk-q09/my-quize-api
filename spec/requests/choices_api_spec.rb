require 'rails_helper'

RSpec.describe "ChoisesApi", type: :request do
    describe 'POST /api/v1/questions/:id/choices' do
      let(:user) { create(:user) }

      before do
        quize = user.quizes.create(title: "Test Quize")
        @question = quize.questions.create(content: "1 + 1 = ?")
      end

      it "creates a choice and returns 200 responds" do
        expect do
          post "/api/v1/questions/#{@question.id}/choices", params: {
            content: "2",
            is_answer: true
          }end.to change(Choice, :count).by(1)
        expect(response).to have_http_status(200)
      end
    end
end
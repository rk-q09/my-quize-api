require 'rails_helper'

RSpec.describe "QuestionsApi", type: :request do
    describe 'POST /api/v1/quizes/:id/questions' do
      let(:user) { create(:user) }

      before do
        @quize = user.quizes.create(title: "Test Quize")
      end

      it "creates a question and returns 200 responds" do
        expect do
          post "/api/v1/quizes/#{@quize.id}/questions", params: {
            content: "1 + 1 = ?"
          }end.to change(Question, :count).by(1)
        expect(response).to have_http_status(200)
      end
    end
end
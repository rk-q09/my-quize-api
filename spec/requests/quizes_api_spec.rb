require 'rails_helper'

RSpec.describe "QuizesApi", type: :request do
    describe 'POST /api/v1/users/:id/quizes' do
        let(:user) { create(:user) }

        it "creates a quizes and returns 200 responds" do
          expect do
            post "/api/v1/users/#{user.id}/quizes", params: {
              title: "Test Question"
            }end.to change(Quize, :count).by(1)
          expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/v1/quizes/:id' do
        let(:user) { create(:user) }

        before do
          @quize = user.quizes.create(title: "Test Quize")
          question = @quize.questions.create(content: "1 + 1 = ?")
          choice = question.choices.create(content: "2", is_answer: true)
        end

        it 'shows a question and choices and returns 200 responds' do
          get "/api/v1/quizes/#{@quize.id}"
          json = JSON.parse(response.body)

          expect(json["questions"][0]["content"]).to eq("1 + 1 = ?")
          expect(json["questions"][0]["choices"][0]["content"]).to eq("2")
          expect(json["questions"][0]["choices"][0]["is_answer"]).to eq(true)
          expect(response).to have_http_status(200)
        end
    end

    describe 'GET /api/v1/users/:id/quizes' do
      let(:user) { create(:user) }

      before do
        quize1 = user.quizes.create(title: "Test Quize1")
        quize2 = user.quizes.create(title: "Test Quize2")
      end

      it 'shows all quizes of a user' do
        get "/api/v1/users/#{user.id}/quizes"
        json = JSON.parse(response.body)
        
        expect(json.length).to eq(2)
      end
    end

    describe 'DELETE /api/v1/quizes/:id' do
      let(:user) { create(:user) }

      before do
        @quize = user.quizes.create(title: "Test Quize")
      end

      it 'deletes a quize' do
        expect{ delete "/api/v1/quizes/#{@quize.id}" }.to change(Quize, :count).by(-1)
      end
    end

    describe 'GET /api/v1/quizes/:id/get_user_id' do
      let(:user) { create(:user) }

      before do
        @quize = user.quizes.create(title: "Test Quize")
      end

      it "returns a user id of the quize" do
        get "/api/v1/quizes/#{@quize.id}/get_user_id"
        json = JSON.parse(response.body)

        expect(json["user_id"]).to eq(user.id)
      end
    end

    describe 'GET /api/v1/new_quizes' do
      let(:user) { create(:user) }

      before do
        quize1 = user.quizes.create(title: "Test Quize1")
        quize2 = user.quizes.create(title: "Test Quize2")
        quize3 = user.quizes.create(title: "Test Quize3")
        quize4 = user.quizes.create(title: "Test Quize4")
      end

      it "returns the latest three quizes" do
        get "/api/v1/new_quizes" 
        json = JSON.parse(response.body)

        expect(json[0]["title"]).to eq("Test Quize4")
        expect(json[1]["title"]).to eq("Test Quize3")
        expect(json[2]["title"]).to eq("Test Quize2")
        expect(json.length).to eq(3)
      end
    end
end
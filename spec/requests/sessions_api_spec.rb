require 'rails_helper'

RSpec.describe "SessionsApi", type: :request do
  describe 'POST /api/v1/sessions' do
    let(:user) { build(:user) }

    before do
        post api_v1_registrations_path, params: {
            user: {
              user_name: user.user_name,
              email: user.email,
              password: user.password,
              password_confirmation: user.password_confirmation
            }
        }
    end

    it "responds correctly" do
        post api_v1_sessions_path, params: {
            user: {
                email: user.email,
                password: user.password
            }
        }
        expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/logged_in' do
    let(:user) { build(:user) }

    before do
        post api_v1_registrations_path, params: {
            user: {
              user_name: user.user_name,
              email: user.email,
              password: user.password,
              password_confirmation: user.password_confirmation
            }
        }
    end

    context 'a user not signed in' do
        it 'returns logged_in status false' do
          get api_v1_logged_in_path
          json = JSON.parse(response.body)
  
          expect(response).to have_http_status(200)
          expect(json["logged_in"]).to eq(false)
        end
    end

    context 'a user signed in' do
        it 'returns logged_in status true' do
            post api_v1_sessions_path, params: {
                user: {
                    email: user.email,
                    password: user.password
                }
            }
            get api_v1_logged_in_path
            json = JSON.parse(response.body)

            expect(response).to have_http_status(200)
            expect(json["logged_in"]).to eq(true)
        end
    end
  end

  describe 'DELETE /api/v1/logout' do
    let(:user) { build(:user) }

    before do
        post api_v1_registrations_path, params: {
            user: {
              user_name: user.user_name,
              email: user.email,
              password: user.password,
              password_confirmation: user.password_confirmation
            }
        }
    end

    it 'successfully logout' do
        post api_v1_sessions_path, params: {
                user: {
                    email: user.email,
                    password: user.password
                }
        }

        delete api_v1_logout_path
        get api_v1_logged_in_path
        json = JSON.parse(response.body)

        expect(response).to have_http_status(200)
        expect(json["logged_in"]).to eq(false)
    end
  end
end
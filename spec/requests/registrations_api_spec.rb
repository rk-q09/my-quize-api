require 'rails_helper'

RSpec.describe "RegistrationsApis", type: :request do
  describe 'POST /api/v1/registration' do
    let(:user) { build(:user) }

    it 'creates a user and returns 200 responses' do
      expect do
        post api_v1_registrations_path, params: {
          user: {
            user_name: user.user_name,
            email: user.email,
            password: user.password,
            password_confirmation: user.password_confirmation
          }
        }end.to change(User, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end
end

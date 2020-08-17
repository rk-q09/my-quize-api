require 'rails_helper'

RSpec.describe "RegistrationsApis", type: :request do
  describe "GET /registrations_apis" do
    it "works! (now write some real specs)" do
      get registrations_apis_index_path
      expect(response).to have_http_status(200)
    end
  end
end

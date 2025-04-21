require 'rails_helper'

RSpec.describe "InssCalculators", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/inss_calculator/create"
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe "DivisibleNumbers", type: :request do
  describe "GET /find_divisible_numbers" do
    it "returns http success" do
      get "/divisible_numbers/find_divisible_numbers"
      expect(response).to have_http_status(:success)
    end
  end

end

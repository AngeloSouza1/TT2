# spec/controllers/divisible_numbers_controller_spec.rb

require 'rails_helper'

RSpec.describe DivisibleNumbersController, type: :controller do
  describe 'GET #find_divisible_numbers' do
    it 'returns JSON with divisible numbers' do
      get :find_divisible_numbers, params: { x: 1, y: 100, w: 5 }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        'x' => 1,
        'y' => 100,
        'w' => 5,
        'divisible_numbers' => [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]
      })
    end

    it 'returns an empty array for x > y' do
      get :find_divisible_numbers, params: { x: 100, y: 1, w: 5 }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        'x' => 100,
        'y' => 1,
        'w' => 5,
        'divisible_numbers' => []
      })
    end

    it 'returns an empty array when no numbers are divisible' do
      get :find_divisible_numbers, params: { x: 1, y: 10, w: 11 }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        'x' => 1,
        'y' => 10,
        'w' => 11,
        'divisible_numbers' => []
      })
    end

    it 'returns an empty array when x and y are equal but not divisible' do
      get :find_divisible_numbers, params: { x: 5, y: 5, w: 3 }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        'x' => 5,
        'y' => 5,
        'w' => 3,
        'divisible_numbers' => []
      })
    end
  end
end

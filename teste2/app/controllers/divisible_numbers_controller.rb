

class DivisibleNumbersController < ApplicationController
  def find_divisible_numbers
    x = params[:x].to_i
    y = params[:y].to_i
    w = params[:w].to_i

    divisible_numbers = find_numbers(x, y, w)
    render json: { x: x, y: y, w: w, divisible_numbers: divisible_numbers }
  end

  private
  def find_numbers(x, y, w)
    (x..y).select { |number| number % w == 0 }
  end
end

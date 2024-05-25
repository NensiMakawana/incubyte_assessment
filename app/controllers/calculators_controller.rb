class CalculatorsController < ApplicationController
  # method for string calculator addition
  def add
    numbers = params[:numbers]
    number_array = numbers.split(/[^0-9-]+/).map(&:to_i)
    negatives_array = number_array.select{ |i| i<0 }
    raise "cannot accept negatives" if negatives_array.length > 0
    total = number_array.inject(0){|sum,x| sum + x }
    render json: { sum: total }
  end
end

require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do
  context 'Addition' do
    it "Allow empty string" do
      post :add, params: { numbers: "" }
    end
  end
end

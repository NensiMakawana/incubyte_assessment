require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do
  context 'Addition' do
    it "Check addition with empty string" do
      post :add, params: { numbers: "" }
      result = JSON.parse(response.body)
      expect(result["sum"]).to eq(0)
    end

    it "Check addition with one number" do
      post :add, params: { numbers: "1" }
      result = JSON.parse(response.body)
      expect(result["sum"]).to eq(1)
    end

    it "Check addition with multiple number with comma separate" do
      post :add, params: { numbers: "1,2,3" }
      result = JSON.parse(response.body)
      expect(result["sum"]).to eq(6)
    end

    it "Check negative number not allow" do
      expect{
        post :add, params: { numbers: "-1,2,3" }
      }.to raise_error('cannot accept negatives')
    end

    it "Check addition with number and new line" do
      post :add, params: { numbers: "1\n2,3" }
      result = JSON.parse(response.body)
      expect(result["sum"]).to eq(6)
    end

    it "Check addition with different delimeter" do
      post :add, params: { numbers: "//;\n1;2" }
      result = JSON.parse(response.body)
      expect(result["sum"]).to eq(3)
    end
  end
end

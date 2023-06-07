require "rails_helper"

describe "Subscriptions", type: :request do
  describe "#index" do
    before do
      @andra = Customer.create!(first_name: "Andra", last_name: "Helton", email: "andra123@example.com", address: "123 some st.")
      andrasub = Subscription.create!(title: "Andra's Subscription #1", price: 10.00, status: 0, frequency: 1, customer_id: @andra.id)
      andrasub2 = Subscription.create!(title: "Andra's Subscription #2", price: 15.00, status: 1, frequency: 0, customer_id: @andra.id)
      andrasub3 = Subscription.create!(title: "Andra's Subscription #3", price: 100.00, status: 1, frequency: 2, customer_id: @andra.id)
      @james = Customer.create!(first_name: "James", last_name: "Taylor", email: "james123@example.com", address: "321 other st.")
      
      get api_v1_customer_subscriptions_path(@andra)
      @parsed = JSON.parse(response.body, symbolize_names: true)
    end

    context "when successful" do
      it "GET all customer subscriptions" do
        expect(response).to be_successful
        expect(@parsed).to have_key(:data)
        expect(@parsed[:data]).to be_an(Array)
        expect(@parsed[:data].size).to eq(3)
        
        @parsed[:data].each do |sub|
          expect(sub.keys).to eq([:id, :type, :attributes])
          expect(sub[:id]).to be_a(String)
          expect(sub[:type]).to eq("subscription")
          expect(sub[:attributes]).to be_a(Hash)
          expect(sub[:attributes].keys).to eq([:title, :price, :status, :frequency])
          expect(sub[:attributes][:title]).to be_a(String)
          expect(sub[:attributes][:price]).to be_a(Float)
          expect(sub[:attributes][:status]).to be_a(String)
          expect(sub[:attributes][:frequency]).to be_a(String)
        end
      end
    end
  end
end
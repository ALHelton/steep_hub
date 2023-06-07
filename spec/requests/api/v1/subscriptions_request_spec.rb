require "rails_helper"

describe "Subscriptions", type: :request do
  before do
    @andra = Customer.create!(first_name: "Andra", last_name: "Helton", email: "andra123@example.com", address: "123 some st.")
    andrasub = Subscription.create!(title: "Andra's Subscription #1", price: 10.00, status: 0, frequency: 1, customer_id: @andra.id)
    andrasub2 = Subscription.create!(title: "Andra's Subscription #2", price: 15.00, status: 1, frequency: 0, customer_id: @andra.id)
    andrasub3 = Subscription.create!(title: "Andra's Subscription #3", price: 100.00, status: 1, frequency: 2, customer_id: @andra.id)
    @james = Customer.create!(first_name: "James", last_name: "Taylor", email: "james123@example.com", address: "321 other st.")
  
    @headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  end
  
  describe "GET customer subscriptions" do
    before do
      get api_v1_customer_subscriptions_path(@andra), headers: @headers
      @parsed = JSON.parse(response.body, symbolize_names: true)
    end

    context "when successful" do
      it "gets subscriptions for a specific customer" do
        expect(response).to be_successful
        expect(@parsed).to be_a(Hash)
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

  describe "POST customer subscription" do
    before do
      @params = ({
        title: "Andra's Subscription #4", 
        price: 100.00, 
        frequency: "yearly",
      })
    end

    context "when successful" do
      before do
        post api_v1_customer_subscriptions_path(@andra), headers: @headers, params: JSON.generate(@params)
        @parsed = JSON.parse(response.body, symbolize_names: true)
      end

      it "gets creates a new subscription for a specific customer" do
        expect(response.status).to eq(201)
        expect(@parsed).to have_key(:data)
        expect(@parsed[:data]).to be_a(Hash)
        expect(@parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(@parsed[:data][:id]).to be_a(String)
        expect(@parsed[:data][:type]).to eq("subscription")
        expect(@parsed[:data][:attributes]).to be_a(Hash)
        expect(@parsed[:data][:attributes].keys).to eq([:title, :price, :status, :frequency])
        expect(@parsed[:data][:attributes][:title]).to be_a(String)
        expect(@parsed[:data][:attributes][:title]).to eq(@params[:title])
        expect(@parsed[:data][:attributes][:price]).to be_a(Float)
        expect(@parsed[:data][:attributes][:price]).to eq(@params[:price])
        expect(@parsed[:data][:attributes][:status]).to be_a(String)
        expect(@parsed[:data][:attributes][:status]).to eq("active")
        expect(@parsed[:data][:attributes][:frequency]).to be_a(String)
        expect(@parsed[:data][:attributes][:frequency]).to eq("yearly")
      end
    end

    context "when unsuccessful" do
      describe "it returns a 401 error" do
        describe "if params are invalid" do
          it "has non-existing customer_id" do
            post api_v1_customer_subscriptions_path(123412341234), headers: @headers, params: JSON.generate(@params)
            parsed = JSON.parse(response.body, symbolize_names: true)
            
            expect(response.status).to eq(401)
            expect(parsed[:error]).to eq("Invalid Credentials")
          end

          it "has invalid customer_id" do
            post api_v1_customer_subscriptions_path("hello"), headers: @headers, params: JSON.generate(@params)
            parsed = JSON.parse(response.body, symbolize_names: true)
            
            expect(response.status).to eq(401)
            expect(parsed[:error]).to eq("Invalid Credentials")
          end

          it "has nil frequency" do
            @params[:frequency] = nil
            post api_v1_customer_subscriptions_path(@andra), headers: @headers, params: JSON.generate(@params)
            parsed = JSON.parse(response.body, symbolize_names: true)
            
            expect(response.status).to eq(401)
            expect(parsed[:error]).to eq("Invalid Credentials")
          end

          it "has nil price" do
            @params[:price] = nil
            post api_v1_customer_subscriptions_path(@andra), headers: @headers, params: JSON.generate(@params)
            parsed = JSON.parse(response.body, symbolize_names: true)
            
            expect(response.status).to eq(401)
            expect(parsed[:error]).to eq("Invalid Credentials")
          end

          it "has invalid price" do
            @params[:price] = "hello"
            post api_v1_customer_subscriptions_path(@andra), headers: @headers, params: JSON.generate(@params)
            parsed = JSON.parse(response.body, symbolize_names: true)
            
            expect(response.status).to eq(401)
            expect(parsed[:error]).to eq("Invalid Credentials")
          end
        end
      end
    end
  end
end
class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(Customer.find(params[:customer_id]).subscriptions)
  end

  def create
    sub = Subscription.new(sub_params)
    
    if sub.save
      render json: SubscriptionSerializer.new(sub), status: 201
    else
      render json: { error: "Invalid Credentials" }, status: 401
    end
  end
end

private
def sub_params
  params.permit(:title, :price, :frequency, :customer_id)
end
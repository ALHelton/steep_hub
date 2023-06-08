class Api::V1::SubscriptionsController < Api::ApiController
  def index
    render json: SubscriptionSerializer.new(Customer.find(params[:customer_id]).subscriptions)
  end

  def create
    correct_price = SubscriptionPrices.price_for_frequency(params[:frequency])
    params = sub_params.merge!(price: correct_price)
    
    subscription = Subscription.new(params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: "Invalid Credentials" }, status: 401
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    correct_price = SubscriptionPrices.price_for_frequency(params[:frequency])
    
    if params[:frequency].present? && params[:frequency] != subscription.frequency
      sub_params_with_price = sub_params.merge!(price: correct_price)
      subscription.update!(sub_params_with_price)
    else
      subscription.update!(sub_params)
    end
    
    render json: SubscriptionSerializer.new(subscription)
  end
end


private

def sub_params
  params.permit(:title, :frequency, :customer_id, :status)
end
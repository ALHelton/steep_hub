require_relative 'subscription_prices'

class Api::ApiController < ApplicationController
  include SubscriptionPrices
end
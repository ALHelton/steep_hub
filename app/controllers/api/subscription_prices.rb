module SubscriptionPrices
  PRICES = {
    "weekly" => 15.00,
    "monthly" => 10.00,
    "yearly" => 100.00
  }.freeze

  def self.price_for_frequency(frequency)
    PRICES[frequency]
  end
end
class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  validates :customer_id, presence: true
  validates :frequency, presence: true

  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :monthly, :yearly]
end
class Order < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  validates :quantity, presence: true, numericality: { greater_than: 0, message:"you cannot order less than 1 burger" }

end

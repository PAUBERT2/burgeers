class Order < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  validates :quantity, presence: true

end

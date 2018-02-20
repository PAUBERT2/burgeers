class Burger < ApplicationRecord
  belongs_to :user
  has_many :orders

  WEEK_DAYS = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]

  validates :name, presence: true
  validates :quantity_max, presence: true
  validates :price, presence: true
  validates :name, uniqueness: { scope: :user, message:"already exist" }
  validates :opening_days, inclusion: { in: WEEK_DAYS, allow_blank: true }
end

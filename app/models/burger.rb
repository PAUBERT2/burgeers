class Burger < ApplicationRecord
  belongs_to :user
  has_many :orders

  WEEK_DAYS = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]

  validates :name, presence: true, uniqueness: { scope: :user, message:"already exist" }
  validates :quantity_max, presence: true, numericality: { greater_than: 0, message:"cannot be negative or null" }
  validates :opening_days, inclusion: { in: WEEK_DAYS, allow_blank: true }
  validates :price, presence: true, numericality: { greater_than: 0, message:"cannot be negative or null" }
end

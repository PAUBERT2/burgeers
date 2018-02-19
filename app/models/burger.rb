class Burger < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :quantity_max, presence: true
  validates :price, presence: true
  validates :name, uniqueness: { scope: :user, message:"already exist" }
  validates :opening_days, inclusion: { in: ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"], allow_blank: true}
end

class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates :name, :address, :date, presence: true
end

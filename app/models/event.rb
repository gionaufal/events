class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates :name, :address, :date, presence: true

  def friendly_date
    date.strftime('%A, %d %b %Y')
  end
end

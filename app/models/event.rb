class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :name, :address, :date, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def friendly_date
    date.strftime('%A, %d %b %Y')
  end
end

require 'open-uri'
OpenURI.redirect_to_https = true

class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :name, :address, :date, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def friendly_date
    date.strftime('%A, %d %b %Y')
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = %w(name image address date)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      event = find_by(id: row['name']) || new
      event.attributes = row.to_hash
      event.save!
    end
  end
end

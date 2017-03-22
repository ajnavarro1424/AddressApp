class Apartment < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  has_attached_file :image, styles: { small: "75x75", med: "300x300", large: "600x600" }
  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }


  def full_address
    "#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{self.zip}, #{self.country}"
  end


end

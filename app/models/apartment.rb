class Apartment < ActiveRecord::Base
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode
  has_attached_file :image, styles: { small: "75x75", med: "300x300", large: "600x600" }
  validates_attachment :image,
    presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes },
    :storage => :s3,
    :s3_host_name => 's3-us-west-1.amazonaws.com'
    :s3_credentials => {
        :bucket => ENV['apartmentapp032417'],
        :access_key_id => ENV['AKIAI4QKXHSN2QJRTWOA'],
        :secret_access_key => ENV['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']

  resourcify

  def full_address
    "#{self.address1}, #{self.address2}, #{self.city}, #{self.state}, #{self.zip}, #{self.country}"
  end


end

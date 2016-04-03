class Book < ActiveRecord::Base
  belongs_to :collection
  belongs_to :publisher

  has_many :writers
  has_many :authors, through: :writers

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  def cover_from_url(url)
    self.cover = URI.parse(url)
  end

end
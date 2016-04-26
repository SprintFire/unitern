class Company < ActiveRecord::Base
  belongs_to :user

  has_many :opportunities, dependent: :destroy

  has_attached_file :logo, styles: { medium: "200x200#",small: "150x150#",thumb: "100x100#" }

  validates :name, presence: true, length: {minimum: 3}
  validates :website, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 75, maximum: 1000}
  validates_attachment_content_type :logo, content_type:  /\Aimage\/.*\Z/, size: { in: 0..1.5.megabytes }
  validates :company_size, presence: true
  validates :founded, presence: true, length: {minimum: 4, maximum: 4}
  validates :headquarters, presence: true, length: {minimum: 3}

end

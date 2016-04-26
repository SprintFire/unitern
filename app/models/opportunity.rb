class Opportunity < ActiveRecord::Base
  belongs_to :company

  has_attached_file :logo, styles: { medium: "300x300#",small: "150x150#",thumb: "100x100#" }

  validates :name, presence: true, length: {minimum: 3}
  validates :location, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 75, maximum: 1000}
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  validates :responsibilities, presence: true, length: {minimum: 75, maximum: 1000}
  validates :duration, presence: true, length: {minimum: 3}
  validates :hourly_rate, presence: true

end

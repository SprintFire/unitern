class Opportunity < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true, length: {minimum: 3}
  validates :location, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 15, maximum: 300}
  validates :responsibilities, presence: true, length: {minimum: 15, maximum: 300}
  validates :duration, presence: true, length: {minimum: 3}
  validates :hourly_rate, presence: true

end

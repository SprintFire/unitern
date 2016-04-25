class Company < ActiveRecord::Base
  belongs_to :user

  has_many :opportunities, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/black.jpg"


  validates :name, presence: true, length: {minimum: 3}
  validates :website, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 75, maximum: 1000}
  validates :company_size, presence: true
  validates :founded, presence: true, length: {minimum: 4, maximum: 4}
  validates :headquarters, presence: true, length: {minimum: 3}

end

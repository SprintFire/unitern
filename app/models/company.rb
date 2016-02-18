class Company < ActiveRecord::Base
  belongs_to :user

  has_many :opportunities, dependent: :destroy

  validates :name, presence: true, length: {minimum: 3}
  validates :website, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 15, maximum: 300}
  validates :company_size, presence: true
  validates :founded, presence: true, length: {minimum: 4, maximum: 4}
  validates :headquarters, presence: true, length: {minimum: 3}

end

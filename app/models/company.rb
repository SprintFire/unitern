class Company < ActiveRecord::Base
  belongs_to :user

  has_many :opportunities, dependent: :destroy

  validates :name, length: {minimum: 3, maximum: 15}
end

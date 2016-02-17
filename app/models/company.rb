class Company < ActiveRecord::Base
  belongs_to :user

  has_many :opportunities

  validates :name, length: {minimum: 3, maximum: 15}
end

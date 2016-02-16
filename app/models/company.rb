class Company < ActiveRecord::Base
  belongs_to :user

  validates :name, length: {minimum: 3, maximum: 15}
end

class Address < ApplicationRecord
  belongs_to :user
  validates :street, :state, :pincode, presence: true
end

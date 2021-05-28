class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address, dependent: :destroy
  has_one_attached :avatar
  
  accepts_nested_attributes_for :address, allow_destroy: true

  delegate :street, :land_mark, :state, :pincode, :address_line, to: :address

  def full_address
    if address.present?
      street.to_s + ', ' + land_mark.to_s + ', ' + state.to_s + ', ' + pincode.to_s rescue ''
    else
      'No Address'
    end
  end
end

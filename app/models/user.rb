class User < ApplicationRecord
  validates :first_name,
            :last_name,
            :username,
            :password,
            :email,
            :status,
            presence: true

  validates :email, uniqueness: true

  has_many :user_permissions, dependent: :destroy
  has_many :permissions, through: :user_permissions, dependent: :destroy
            
  enum status: { status_1: 'status_1', status_2: 'status_2' }

  def full_name
    "#{first_name} #{last_name}"
  end
end

class User < ApplicationRecord
  has_many :permissions, dependent: :destroy
  accepts_nested_attributes_for :permissions,
                                allow_destroy: true,
                                reject_if: :all_blank
  validates :first_name,
            :last_name,
            :username,
            :password,
            :email,
            :status,
            presence: true

  validates :email, uniqueness: true

            
  enum status: { status_1: 'status_1', status_2: 'status_2' }

  def full_name
    "#{first_name} #{last_name}"
  end
end

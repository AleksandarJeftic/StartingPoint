class User < ApplicationRecord
  validates :first_name,
            :last_name,
            :username,
            :password,
            :email,
            :status
            
  enum status: { status_1: 'status_1', status_2: 'status_2' }
end

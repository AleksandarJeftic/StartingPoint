class Permission < ApplicationRecord
  validates :code, :description, presence: true
end

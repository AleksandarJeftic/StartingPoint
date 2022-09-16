class Permission < ApplicationRecord
  validates :code, :description, presence: true
  validates :code, numericality: { integer_only: true }
  validates :code, uniqueness: true
end

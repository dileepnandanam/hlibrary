class Book < ApplicationRecord
  validates :serial_number, presence: true
  validates :name, presence: true
  has_and_belongs_to_many :users

  validates :serial_number, uniqueness: true

  default_scope -> {order('id DESC')}
end

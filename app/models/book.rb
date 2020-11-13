class Book < ApplicationRecord
  validates :serial_number, presence: true
  validates :name, presence: true
  has_many :books_users

  validates :serial_number, uniqueness: true

  default_scope -> {order('id DESC')}
end

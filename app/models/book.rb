class Book < ApplicationRecord
  validates :serial_number, presence: true
  validates :name, presence: true
  belongs_to :user, optional: true

  scope :available, -> () {where(user_id: nil)}

  validates :serial_number, uniqueness: true

  default_scope -> {order('id DESC')}
end

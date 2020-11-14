class Book < ApplicationRecord
  validates :serial_number, presence: true
  validates :name, presence: true
  validates :author, presence: true
  has_many :books_users

  validates :serial_number, uniqueness: true

  default_scope -> {order('id DESC')}

  def self.search(query, user)
    Book.left_for(user).where("lower(books.name) like '%#{query.downcase}%' OR lower(books.author) like '%#{query.downcase}%'")
  end

  def self.left_for(user)
    Book.joins("left join books_users on books_users.book_id = books.id AND books_users
.user_id = #{user.id}")
    .joins('left join users on users.id = books_users.user_id')
    .where(users: {id: nil})
  end
end

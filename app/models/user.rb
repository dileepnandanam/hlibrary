class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def has_book?(book)
    BooksUser.where(user_id: id, book_id: book.id).first.present?
  end

  def borrow(book)
    BooksUser.where(user_id: id, book_id: book.id).first_or_create
  end

  def return(book)
    BooksUser.where(user_id: id, book_id: book.id).delete_all
  end

  def books
    Book.joins(:books_users).where(books_users: {user_id: id})
  end
end

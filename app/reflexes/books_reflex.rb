# frozen_string_literal: true

class BooksReflex < ApplicationReflex
  delegate :current_user, to: :connection
  delegate :render, to: ApplicationController

  def borrow
    book = Book.find_by_id element.dataset['id']
    current_user.borrow(book)
    morph '.my-books', render(partial: 'books/my_books', locals: {my_books: current_user.books})
  end

  def return
    book = Book.find_by_id element.dataset['id']
    current_user.return(book)
    morph '.my-books', render(partial: 'books/my_books', locals: {my_books: current_user.books})
  end
end

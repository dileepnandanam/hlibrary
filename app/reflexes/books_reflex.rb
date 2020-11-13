# frozen_string_literal: true

class BooksReflex < ApplicationReflex
  delegate :current_user, to: :connection
  delegate :render, to: ApplicationController

  def borrow
    book = Book.find_by_id element.dataset['id']
    unless current_user.books.include?(book)
      current_user.books << book
      morph '.my-books', render(partial: 'books/my_books', locals: {my_books: current_user.books.all})
    end
  end

  def return
    book = Book.find_by_id element.dataset['id']
    current_user.books.delete book
    morph '.my-books', render(partial: 'books/my_books', locals: {my_books: current_user.books.all})
  end
end

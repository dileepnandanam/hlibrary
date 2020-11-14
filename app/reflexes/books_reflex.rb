# frozen_string_literal: true

class BooksReflex < ApplicationReflex
  delegate :current_user, to: :connection
  delegate :render, to: ApplicationController

  def borrow
    book = Book.find_by_id element.dataset['id']
    current_user.borrow(book)
    morph '.my-books', render(partial: 'books/my_books', locals: {my_books: current_user.books})
    morph '.books', render(partial: 'books/books', locals: {books: Book.left_for(current_user)})
  end

  def return
    book = Book.find_by_id element.dataset['id']
    current_user.return(book)
    morph '.my-books', render(partial: 'books/my_books', locals: {my_books: current_user.books})
    morph '.books', render(partial: 'books/books', locals: {books: Book.left_for(current_user)})
  end

  def search
    query = element.value
    morph '.books', render(partial: 'books/books', locals: {books: Book.search(query, current_user)})
  end

  def show
    book = Book.find_by_id element.dataset['id']
    morph '.page', render(partial: 'books/show', locals: {book: book})
  end

  def index
    books = Book.left_for(current_user)
    my_books = current_user.books
    morph '.page', render(partial: 'books/index', locals: {books: books, my_books: my_books})
  end

  protected
end

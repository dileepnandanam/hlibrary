class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def borrow
    @book = Book.find_by_id params[:id]
    @book.update user_id: current_user.id
    render partial: 'my_book', locals: {book: @book}
  end

  def return
    @book = Book.find_by_id params[:id]
    @book.update user_id: nil
    render partial: 'book', locals: {book: @book}
  end
end
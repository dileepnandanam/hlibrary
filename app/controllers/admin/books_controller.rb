class Admin::BooksController < ApplicationController
  include CableReady::Broadcaster

  def index
    @books = Book.all
  end

  def create
    @book = Book.create book_params
    if @book.valid?
      render partial: 'book', locals: {book: @book}
    else
      render 'new'
    end
  end

  def destroy
    @book = Book.find_by_id params[:id]
    @book.delete
    render plain: 'ok'
  end

  def edit
    @book = Book.find_by_id params[:id]
    render 'edit'
  end

  def update
    @book = Book.find_by_id params[:id]
    @book.update(book_params)
    if @book.valid?
      render partial: 'book', locals: {book: @book}
    else
      render 'edit'
    end
  end

  protected
    def book_params
      params.require(:book).permit(:name, :serial_number)
    end
end
class BooksController < ApplicationController
  before_action :check_permission
  def index
    @books = Book.all
  end

  def show
    @book = current_user.books.find_by_id params[:id]
  end
end
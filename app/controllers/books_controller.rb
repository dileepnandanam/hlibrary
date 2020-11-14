class BooksController < ApplicationController
  before_action :check_permission
  def index
    @books = Book.left_for(current_user)
  end

  def show
    @book = current_user.books.find_by_id params[:id]
    if @book.blank?
      render 'layouts/noaccess' and return
    end
  end
end
class BooksController < ApplicationController
  before_action :check_permission
  def index
    @books = Book.all
  end
end
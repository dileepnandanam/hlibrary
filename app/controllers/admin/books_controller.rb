class Admin::BooksController < ApplicationController
  include CableReady::Broadcaster

  def index
    @books = Book.all
  end
end
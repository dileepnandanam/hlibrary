class Admin::BooksController < ApplicationController
  before_action :check_permission

  def index
    @books = Book.all
  end

  protected

  def check_permission
    unless current_user.try(:admin?)
      render 'layouts/noaccess'
    end
  end
end
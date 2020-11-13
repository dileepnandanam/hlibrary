# frozen_string_literal: true

class Admin::BooksReflex < ApplicationReflex
  delegate :render, to: ApplicationController

  def new
    book = Book.new
    morph '.new-book-form-container', render(partial: 'admin/books/new', locals: {book: book})
  end

  def edit
    book = Book.find_by_id element.dataset['id']
    morph "#edit-book-#{book.id}", render(partial: 'admin/books/edit', locals: {book: book})
  end

  def destroy
    book = Book.find_by_id element.dataset.id
    book.delete
    morph '.books', render(partial: 'admin/books/books', locals: {books: Book.all})
  end

  def update
    book = Book.find_by_id element.dataset.id
    book.update(book_params)
    if book.valid?
      morph "#book-#{book.id}", render(partial: 'admin/books/book', locals: {book: book})
    else
      morph "#edit-book-#{book.id}", render(partial: 'admin/books/edit', locals: {book: book})
    end
  end

  def create
    @book = Book.create book_params
    if @book.valid?
      morph '.books', render(partial: 'admin/books/books', locals: {books: Book.all})
      morph '.new-book-form-container', ''
    else
      morph '.new-book-form-container', render(partial: 'admin/books/new', locals: {book: @book})    
    end
  end

  protected
  def book_params
    params.require(:book).permit(:name, :serial_number, :author)
  end
end

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'should return result on keyword search' do
    book = Book.create(name: 'name123', author: 'author456', serial_number: 'a123')
    assert Book.search('123', users('normal_user')).include?(book)
  end

  test 'should return books left to borrow' do
    users('normal_user').borrow(books('one'))
    assert Book.left_for(users('normal_user')).include?(books('two'))
  end
end

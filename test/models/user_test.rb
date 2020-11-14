require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user should borrow book' do
    users('normal_user').borrow(books('one'))
    assert users('normal_user').books.count == 1
  end

  test 'user should return book' do
    users('normal_user').borrow(books('one'))
    assert users('normal_user').books.count == 1

    users('normal_user').return(books('one'))
    assert users('normal_user').books.count == 0
  end
end

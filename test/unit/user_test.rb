require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "login creates user for new emails" do
    assert_difference "User.count", 1 do
      User.login(email: 'new_email@test.com')
    end
  end

  test "login with existing user doesn't create a new one" do
    assert_no_difference "User.count" do
      User.login(email: users(:ernesto).email)
    end
  end

  test "login with existing user doesn't override the name" do
    user = User.login(email: users(:ernesto).email, name: 'A new name')
    assert_equal 'Ernesto Jimenez', user.name
  end

  test "login with new user and no name takes username from email" do
    user = User.login(email: 'john.doe@whatever.com')
    assert_equal 'john.doe', user.name
    user = User.login(email: 'john.doe+playing@whatever.com')
    assert_equal 'john.doe', user.name
  end

  test "login populates name" do
    user = User.login(email: 'new_email@test.com', name: 'John Doe')
    assert_equal 'John Doe', user.name
  end

  test "login with no email throws an exception" do
    assert_raise ArgumentError do
      User.login
    end
  end
end

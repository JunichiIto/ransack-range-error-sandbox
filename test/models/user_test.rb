require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "ActiveModel::RangeError" do
    user = users(:one)
    assert_equal [user], User.where(age: 10)
    assert_equal [user], User.ransack(age_eq: 10).result

    assert_equal [], User.where(age: 123456789012345678901)
    assert_equal [], User.ransack(age_eq: 123456789012345678901).result
    #=> ActiveModel::RangeError: 123456789012345678901 is out of range for ActiveRecord::ConnectionAdapters::SQLite3Adapter::SQLite3Integer with limit 8 bytes
  end
end

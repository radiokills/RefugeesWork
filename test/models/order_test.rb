require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "factory" do
    order = build(:order)
    saved = order.save
    assert_equal(true, saved)
  end
end

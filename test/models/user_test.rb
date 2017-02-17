require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Factory" do
    user = build(:user)
    saved = user.save
    assert_equal(saved, true)
  end

  test "Selecting" do
    user = create :user
    lead = create :lead
    order = create :order, selector: user, selected: true, selected: lead
    assert_equal user.selecting?(lead), order
  end

  test "User can select lead" do
    user = create :user
    lead = create :lead
    assert_difference 'Order.count' do
      user.select!(lead)
    end
  end

end

require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  
  test "validates description presence" do
    lead = build(:lead, description: nil)
    lead.save
    assert_equal(lead.errors.count, 1)
    assert_equal(lead.errors.keys.include?(:description), true)
  end

  test "validates business_type presence" do
    lead = build(:lead, business_type: nil)
    lead.save
    assert_equal(lead.errors.count, 1)
    assert_equal(lead.errors.keys.include?(:business_type), true)
  end

  test "validates address presence" do
    lead = build(:lead, address: nil)
    lead.save
    assert_equal(lead.errors.count, 1)
    assert_equal(lead.errors.keys.include?(:address), true)
  end

  test "validates name presence" do
    lead = build(:lead, name: nil)
    lead.save
    assert_equal(lead.errors.count, 1)
    assert_equal(lead.errors.keys.include?(:name), true)
  end

  test "validates email presence" do
    lead = build(:lead, email: nil)
    lead.save
    assert_equal(lead.errors.count, 2)  # We get two errors for email, one is for presence other one is for wron format
    assert_equal(lead.errors.keys.include?(:email), true)
  end

  test "validates email format" do
    lead = build(:lead, email: "wrongemail.com")
    saved = lead.save
    assert_equal(saved, false)
    assert_equal(lead.errors.keys.include?(:email), true)
    lead.email = "correct@format.com"
    saved = lead.save
    assert_equal(saved, true)
  end

  test "current step retrns right value" do
    lead = build(:lead)
    assert_equal lead.current_step, lead.steps.first
    lead.current_step = lead.steps.last
    assert_equal lead.current_step, lead.steps.last
  end


end

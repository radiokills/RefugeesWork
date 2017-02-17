FactoryGirl.define do
  factory :order do
    association :selected, factory: :lead, strategy: :create
    association :selector, factory: :user, strategy: :create
    paid false
    notes "Nice Note"
  end

  factory :paid_order do
    paid true
  end
end

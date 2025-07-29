# frozen_string_literal: true

FactoryBot.define do
  factory :product_affiliate do
    association :product
    association :affiliate, factory: :direct_affiliate
    affiliate_basis_points { 1000 }
    approved { true }

    trait :unapproved do
      approved { false }
    end
  end
end

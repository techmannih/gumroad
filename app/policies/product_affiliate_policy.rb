class ProductAffiliatePolicy < ApplicationPolicy
  def destroy?
    user == record.affiliate.affiliate_user
  end

  def update?
    destroy?
  end
end

class Api::Internal::AffiliatedProductsController < Api::Internal::BaseController
  before_action :authenticate_user!
  after_action :verify_authorized

  def update
    product_affiliate = find_affiliate!
    authorize product_affiliate
    product_affiliate.update!(approved: params[:approved])
    head :ok
  end

  def destroy
    product_affiliate = find_affiliate!
    authorize product_affiliate
    product_affiliate.destroy!
    head :ok
  end

  private
    def find_affiliate!
      product = Link.find_by_external_id!(params[:id])
      affiliate = DirectAffiliate.alive.find_by(seller: product.user, affiliate_user: current_seller)
      e404_json if affiliate.nil?
      product_affiliate = affiliate.product_affiliates.find_by(link_id: product.id)
      e404_json if product_affiliate.nil?
      product_affiliate
    end
end

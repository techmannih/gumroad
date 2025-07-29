class AddApprovedToAffiliatesLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :affiliates_links, :approved, :boolean, default: false, null: false
  end
end

class AddOpportunityToCompany < ActiveRecord::Migration
  def change
    add_column :opportunities, :company_id, :integer
  end
end

class AddMoreFieldsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :founded, :integer
    add_column :companies, :headquarters, :text

  end
end

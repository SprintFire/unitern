class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.text :description
      t.integer :company_size

      t.timestamps null: false
    end
  end
end

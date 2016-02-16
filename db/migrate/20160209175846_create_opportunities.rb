class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :name
      t.text :description
      t.text :location
      t.text :responsibilities
      t.string :duration
      t.decimal :hourly_rate, :precision => 6, :scale => 2, :default => 0.00

      t.timestamps null: false
    end
  end
end

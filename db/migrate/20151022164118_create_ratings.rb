class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :severity
      t.references :topic, index: true
      t.references :post, index: true

      t.references :rateable, index: true
      t.timestamps null: false
    end
  end
end

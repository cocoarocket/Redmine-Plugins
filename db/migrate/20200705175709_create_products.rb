class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :number
      t.date :production_date
      t.integer :issue_id
    end
  end
end

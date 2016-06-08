class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :description, null: false
      t.decimal :price, precision: 6, scale: 2, null: false
      t.datetime :created_at, null: false
    end
  end
end

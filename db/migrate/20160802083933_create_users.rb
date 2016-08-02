class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :pinyin
      t.datetime :birthday
      t.boolean :gender
      t.string :icon
      t.string :mobile

      t.timestamps
    end
  end
end

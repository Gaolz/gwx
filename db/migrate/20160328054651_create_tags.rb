class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, comment: '博客标签表' do |t|
      t.string :name, index: true, comment: '标签名'

      t.timestamps null: false
    end
  end
end

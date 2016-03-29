class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :post, index: true, foreign_key: true, comment: '日志ID'
      t.belongs_to :tag, index: true, foreign_key: true, comment: '标签ID'

      t.timestamps null: false
    end
  end
end

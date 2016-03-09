class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, comment: '博客表' do |t|
      t.string :title, limit: 30, null: false, default: '我的日志', comment: '标题'
      t.text :content, comment: '内容'

      t.timestamps null: false
    end
  end
end

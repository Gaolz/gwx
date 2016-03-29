class AddUrlTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :url_title, :string, comment: '日志地址名'
    add_index :posts, :url_title
  end
end

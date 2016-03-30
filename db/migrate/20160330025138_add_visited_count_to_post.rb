class AddVisitedCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :visited_count, :integer, null: false, default: 0, comment: '日志浏览量'
  end
end

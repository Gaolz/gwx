class Tagging < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag

  def self.post_count(tag_name)
    tag_id = Tag.find_by_name(tag_name).id
    where(tag_id: tag_id).count
  end
end

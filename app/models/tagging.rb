# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taggings_on_post_id  (post_id)
#  index_taggings_on_tag_id   (tag_id)
#

class Tagging < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  def self.post_count(tag_name)
    tag_id = Tag.find_by_name(tag_name).try(:id)
    where(tag_id: tag_id).count
  end
end

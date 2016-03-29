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

class Tagging < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag

  def self.post_count(tag_name)
    tag_id = Tag.find_by_name(tag_name).id
    where(tag_id: tag_id).count
  end
end

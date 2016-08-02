# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  title         :string(30)       default("我的日志"), not null
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  url_title     :string
#  visited_count :integer          default(0), not null
#
# Indexes
#
#  index_posts_on_url_title  (url_title)
#

class Post < ApplicationRecord
  require 'chinese_pinyin'

  validates :title, presence: true, uniqueness: true
  validates :url_title, presence: true, uniqueness: true
  validates :content, presence: true
  has_many :taggings
  has_many :tags, through: :taggings

  def to_param
    url_title
  end

  def self.tagged_with(name)
    Tag.find_by_name(name).try(:posts)
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end
end

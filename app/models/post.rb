class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  has_many :photos
  has_many :taggings
  has_many :tags, through: :taggings

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

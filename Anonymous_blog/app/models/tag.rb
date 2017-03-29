class Tag < ActiveRecord::Base
  
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :tag, uniqueness: true

  def self.search_tags(tag)
    Tag.find_by(tag: tag)
  end

  def self.show_tags
    Tag.all
  end

  def self.database_tag(tag)
    if Tag.find_by(tag: tag)
      Tag.find_by(tag: tag)
    else
      Tag.create(tag: tag)
    end
  end
end

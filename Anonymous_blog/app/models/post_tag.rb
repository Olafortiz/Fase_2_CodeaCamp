class PostTag < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :tag

  #def search

  def self.search_posts_by_tag(tag)
    @tag = Tag.find_by(tag: tag)
    post = PostTag.find_by(tag_id: @tag.id) 
  end
end

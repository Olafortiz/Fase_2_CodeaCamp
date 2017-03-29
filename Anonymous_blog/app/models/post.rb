class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :body, :presence => true
  validates :title, :presence => true

  def self.show_posts
    Post.all 
  end

  def self.search_post(input)
    Post.find_by(title: input)
  end

  def self.delete_entry(input)
    @post_to_destroy = Post.where(title: input)
    @post_to_destroy.each do |each_post|
    Post.delete(each_post)
  end
  end

  def self.update_entry(title, new_title, new_body)
    @post_to_update = Post.find_by(title: title)
    Post.update(@post_to_update.id, title: new_title, body: new_body)
  # Remember to create a migration!
  end
end

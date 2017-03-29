get '/posts' do
  @posts = Post.all

  erb :posts
end

get '/new_entry' do
  erb :new_entry
end

post '/new_entry' do
  @title = params[:title].capitalize
  @body = params[:body]
  @author = params[:author]
  @post = Post.create(title: @title, body: @body, author: @author)
  multiple_tags = params[:tags].strip.split(', ')
  
  multiple_tags.each do |tags|
    puts @tag = Tag.database_tag(tags)
    PostTag.create(post_id: @post.id, tag_id: @tag.id)
  end

  redirect to "/post/#{@post.id}"
end

get '/post/:post' do

  @post = Post.last
  erb :post
end



post '/search_entry' do
  @title = params[:title].downcase
  redirect to "/search_posts/#{@title}"
end

get '/search_posts/:title' do 
  @title = params[:title].downcase
  @post = Post.search_post(@title)
  if @post
    @post 
  end
  erb :search_posts
  
end



post '/delete_entry' do
  @title = params[:title].downcase
  @post = Post.delete_entry(@title)
  redirect to '/posts'
end

post '/update_entry' do 
  @title = params[:title].downcase
  @new_title = params[:new_title].downcase
  @new_body = params[:new_body].downcase
  @post = Post.update_entry(@title, @new_title, @new_body)
  erb :post
end






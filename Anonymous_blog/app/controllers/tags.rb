get '/search_tags' do

erb :search_tags
end

post '/search_tags' do
  @tag = params[:tag].downcase
  
  redirect to "/tag/#{@tag}"
end

get '/tag/:tag' do
  @tag = params[:tag].downcase
  tag_search = Tag.where(tag: @tag).first
  if tag_search
    @posts = tag_search.posts
  end
  erb :tag
end


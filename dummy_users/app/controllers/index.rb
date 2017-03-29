
get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/log_in' do
  @email = params[:email]
  @password = params[:pass]
  
  if User.authenticate(@email, @password)
    
    @user = User.find_by(email: @email)
    session[:id] = @user.id
    redirect to "/users_home/#{@user.id}"

  else
    redirect to '/log_in'
  end

end

get '/log_in' do
  erb :log_in
end

get '/new_user' do

  erb :sign_in

end

post '/new_user' do

  @user = User.new(name: params[:fullname], email: params[:email], password: params[:pass] )

  if @user.save
    session[:id] = @user.id
    redirect to "/users_home/#{@user.id}"
  else
    "ERROR"
    erb :sign_in 
  end


end
 
 before '/users_home/:id'  do
    if session[:id] == nil
      redirect to '/log_in'
    end
  end

get '/users_home/:id' do
 @user = User.find(session[:id])
 erb :profile
end




get '/log_out' do 
  session.clear
  redirect to '/'  
end

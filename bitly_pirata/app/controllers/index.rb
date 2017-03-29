

# Deberás tener una ruta dentro de tu controlador que enliste todas las Urls y otra que por medio de un post cree un objeto url.

# Los métodos dentro de tu controlador deberán parecerse a lo siguiente:
get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @database = Url.all
  erb :index
end

post '/' do
  @user_url = params[:url]

  Url.create(long_url: @user_url)
  redirect to '/'
  
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
end

get '/urls' do
  # crea una nueva Url
  
end

# e.g., /q6bda
get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  url.increment(:click_count).save
  redirect to url.long_url
  # redirige a la URL original
end

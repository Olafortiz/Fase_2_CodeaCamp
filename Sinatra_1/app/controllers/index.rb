  #  require 'sinatra'
  #  #require 'activerecord'
  #  require 'sinatra/contrib'
  # #require './models/url.rb'
  #     set :database, {adapter: "pg", database: "db/cool_url.pg", pool: 30}

  get '/' do
    erb :index
  end

  post '/cool_url' do
    # Capturamos los valores del formulario con 'params'
    input  = params[:input]
    # Creamos una instancia de la clase User con sus atributos necesarios
    message  = Url.new(input: input)
    # Si el usuario se guardó en la DB, redirige a su perfil, de otra forma
    # vuelve a mostrar el formulario.
    if message.save
      redirect to("/cool_url/#{message.id}")
    else
      erb :index
    end
  end

    get '/cool_url/:id' do
    @message = Url.find(params[:id])
    erb :post_cool_url
  end

  get '/cool_url' do
    @messages = Url.all
    erb :get_cool_url
  end



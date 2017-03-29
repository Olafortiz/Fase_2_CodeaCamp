get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end

post '/abuelita' do
  input = params[:user_input]
  a = Abuela.deaf_grandma(input)
end

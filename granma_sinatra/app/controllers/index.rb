get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end

get '/abuelita' do
  input = params[:user_input]
  a = Abuela.deaf_grandma(input)
  redirect to ("/?abuelita=#{a}")
end

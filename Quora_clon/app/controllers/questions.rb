get '/questions/new' do
  erb :questions
end

post '/question/new' do
  @user = User.find(session[:id])
  @new_question = Question.new(body: params[:question])

  if @new_question.save
    @user.questions << @new_question
    redirect to '/'
  else
    erb :errors
  end
  
end

get '/questions/all' do
  @questions = Question.all
  
  erb :index
  
end


get '/question/:question_id' do 
  @question = Question.find(params[:question_id])
  @user = User.find(session[:id])
  erb :question
end


get '/question/:question_id/update' do 
  @question = Question.find(params[:question_id])
  erb :edit_question

end

post '/question/:question_id/update' do
  @user = User.find(session[:id])
  @question = Question.find(params[:question_id])
  new_body = params[:body]
 
  if new_body.empty?
    redirect to "/question/#{@question.id}"
  else
    @question.update(body: new_body)
  end

  redirect to "/users_home/#{@user.id}"

end


get "/question/delete/:question_id" do 
  @user = User.find(session[:id])
  @question = Question.find(params[:question_id])
  @question.destroy
  redirect to "/users_home/#{@user.id}"
end




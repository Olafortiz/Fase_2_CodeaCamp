post '/answer' do 
  @question = Question.find(params[:question_id])
  @answer = params[:answer]
  @user = User.find(session[:id])
  @new_answer = Answer.new(answer_body: @answer, question_id: @question.id, user_id: @user.id)
  @answers = Answer.find_by(question_id: @question.id)
  

  if @new_answer.save
    @user.answers << @new_answer
    @question.answers << @new_answer
    redirect to "/question/#{@question.id}"
  else
    erb :errors
  end
end


get '/answer/like/:user_id/:question_id/:answer_id' do
  
  @question = params[:question_id]
  @user = User.find(session[:id])
  ans = params[:answer_id]
  voto = AnswerVote.find_by(answer_id: ans, user_id: @user.id)
  puts "+" * 100
  # @Answer = Answer.find(ans) << voto.votes 
  if voto
    voto.votes += 1
    voto.save
    Answer.find(ans).update(votes: voto.votes) 
  else
    AnswerVote.create(answer_id: ans, user_id: @user.id, votes: 1)
  end
    redirect to "/question/#{@question}"
end


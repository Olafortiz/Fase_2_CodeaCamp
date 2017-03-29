post '/poll/:poll_id/add_questions' do
  poll = params[:poll_id]
  @poll = Poll.find(poll)
  @question = Question.new(title: params[:question_name])
  if @question.save
    @poll.questions << @question
    redirect to "/question/#{@question.id}/add_options"
  else
    nil
  end


  if request.xhr?
    erb :"poll/options", layout: false # respond to Ajax request
  else
    erb :index  # respond to normal request
  end

end

get '/question/:question_id/add_options' do
  question = params[:question_id]
  @option = Option.create
  @question = Question.find(question)
  erb :"poll/options", layout: false
end

post '/question/:question_id/add_option' do
  puts "PARAMETROS"
  p params
  question = params[:question_id]
  @question = Question.find(question)
  @option = Option.find(params[:option_id])
  @option.body = params[:option]

  if @option.save
    @question.options << @option
  end

  if request.xhr?
    @option = Option.create
    erb :"poll/options", layout: false
  end

end
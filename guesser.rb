require 'sinatra'


get '/' do
  erb :homepage
end

get '/start' do
  secret_number = rand(100)
  redirect "/play/#{secret_number}/Start"
end

get '/play/:secret_number/:message' do
  erb :play, locals: { secret_number: params[:secret_number], message: params[:message] }
end

post '/check/:secret_number' do
  secret_number = params[:secret_number].to_i
  guess = params[:guess].to_i
  case
    when secret_number == guess
      erb :you_won
    when guess > secret_number
      redirect "/play/#{secret_number}/Too high"
    when guess < secret_number
      redirect "/play/#{secret_number}/Too low"
  end
end
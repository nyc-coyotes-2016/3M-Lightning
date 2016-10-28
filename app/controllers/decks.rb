
get '/decks'
  erb :'/decks'
end

get '/decks/new'
  erb :'decks/new'
end

post '/decks' do
  new_decks = User.new(params[:decks])
  if new_decks.valid?
    new_decks.save
    redirect ''#sessions redirect!!!!!!!!!!!!!!
  else
    erb :'/decks/new'
  end
end

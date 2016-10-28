#all decks
get '/decks' do
  @decks = Deck.order(:created_at)
  erb :'/decks'
end
# new deck entry form
get '/decks/new' do
  erb :'decks/new'
end
# create new deck with cards
post '/decks' do
  new_decks = User.new(params[:decks])
  if new_decks.valid?
    new_decks.save
    redirect ''#sessions redirect!!!!!!!!!!!!!!
  else
    erb :'/decks/new'
  end
end

get '/decks/:subject' do
#get '/show-one-entry/:subject' do
  @deck = Deck.find(params[:subject])
  erb :'decks/show'
end
#edit deck entry
get '/decks/:subject/edit' do
  @deck = Deck.find(params[:subject])
  erb :'decks/edit'
end

#update
put '/entries/:subject' do
  deck = Deck.find(params[:subject])
  deck.update_attributes(params[:deck])
  redirect "/decks/:subject"
end

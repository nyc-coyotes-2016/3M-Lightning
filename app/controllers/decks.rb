#all decks
get '/decks' do
  @decks = Deck.all
  erb :index
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
    redirect 'decks/new'#sessions redirect!!!!!!!!!!!!!!
  else
    erb :'/decks/new'
  end
end

get '/decks/:id' do
#get '/show-one-entry/:subject' do
  @deck_id = params[:id]
  @cards = Card.where(deck_id: @deck_id)
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end
#edit deck entry
get '/decks/:id/edit' do
  @card = Card.find(params[:id])
  erb :'decks/edit'
end

#update
put '/deck/:subject' do
  deck = Deck.find(params[:subject])
  deck.update_attributes(params[:deck])
  redirect "/decks/:subject"
end

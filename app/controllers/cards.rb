get '/cards' do
  @cards = Card.all
  erb :'/decks/show'
end

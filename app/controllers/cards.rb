get '/cards' do
  @cards = Card.find_by(params[:deck_id])
  erb :'/decks/show'
end

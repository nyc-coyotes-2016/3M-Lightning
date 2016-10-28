before '/*' do
  if session[:user_id]
    @authorized = true
  else
    @authorized = false
  end
  @user = User.find_by(id: session[:user_id])
end

get '/' do
  redirect '/decks'
end

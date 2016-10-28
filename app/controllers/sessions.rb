get '/sessions/new' do
  erb :'sessions/login'
end


post '/sessions' do
  puts params
  @user = User.find_by(user_name: params[:user_name]).try(:authenticate, "#{params[:password]}")
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/sessions/login'
  end
end


delete '/sessions' do
  session.clear
  redirect '/'
end

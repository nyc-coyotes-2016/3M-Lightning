get '/users' do
  @users = User.all
  erb :index
end

get'/users/new' do
  erb :'users/new'
end

post '/users' do
  new_user = User.new(params[:users])
  if new_user.valid?
    new_user.save
    redirect ''  #sessions redirect!!!!!!!!!!!!!!

  else
    erb :'/users/new'
  end
end

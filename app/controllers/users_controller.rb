require 'pry'

class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/tweets"
    else
    erb :'users/create_user'
  end
end

post '/signup' do
  #binding.pry
  @user = User.create(params)
  session[:id] = @user.id
  if params[:username].empty? || params[:email].empty? || params[:password].empty?
    redirect "/signup"
  else
    redirect "/tweets"
  end
end

  get '/login' do
    if logged_in?
      redirect "/tweets"
    else
    erb :'users/login'
  end
end

post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user[:id]
      redirect "/tweets"
    else
      redirect "/signup"
    end
  end





end

require 'pry'

class TweetsController < ApplicationController

  get '/tweets' do
    # raise params.inspect
      if logged_in?
        #@user = current_user
        @tweets = Tweet.all
        erb :'/tweets/tweets'
      else
        redirect :'/login'
      end
    end

    get '/tweets/new' do
      if logged_in?
      #@user = current_user
      erb :'/tweets/new'
    else
      redirect :'/login'
    end
  end

    post '/tweets' do
      #binding.pry
      if params[:content].empty?
        redirect :'/tweets/new'
<<<<<<< HEAD
      else
        @user = current_user
        @tweet = Tweet.create(params)
        @user.tweets << @tweet
      redirect :"/tweets/#{@tweet.id}"
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    if logged_in?
      erb :'/tweets/show_tweet'
    else
      redirect :"/login"
    end
  end

  get 'tweets/:id/edit' do
    #binding.pry
    raise params.inspect
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      @user = current_user
      if @tweet.user_id == @user.id
        erb :'/tweets/edit_tweet'
      else
        redirect :'/login'
      end
    end
  end

  patch '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.update(params[:content])

  redirect :"/tweets/#{@tweet.id}"
end

  delete '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    if @user = current_user
    @tweet.delete
    redirect to '/tweets'
  else
    redirect to '/login'
=======
      else
        @user = current_user
        @tweet = Tweet.create(params)
        @user.tweets << @tweet
      redirect :"/tweets/#{@tweet.id}"
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    if logged_in?
      erb :'/tweets/show_tweet'
    else
      redirect :"/login"
    end
  end

  get '/tweets/:id/edit' do
    #binding.pry
    #raise params.inspect
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      @user = current_user
      if @tweet.user_id == @user.id
        erb :'/tweets/edit_tweet'
      else
        redirect :'/tweets'
      end
    else
      redirect :'/login'
    end
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    if params[:content].empty?
      redirect :"/tweets/#{@tweet.id}/edit"
    else
      @tweet.update(content: params[:content])
      redirect :"/tweets/#{@tweet.id}"
    end
  end

  delete '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    if logged_in?
      @user = current_user
      if @tweet.user_id == @user.id
        @tweet.delete
        redirect to '/tweets'
      end
    else
      redirect to '/login'
    end
>>>>>>> 303057f6e5bbb83536f63a6522cd3da060c46333
  end
end


end

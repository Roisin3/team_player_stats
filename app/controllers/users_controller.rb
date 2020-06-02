require './config/environment'

class UsersController < ApplicationController
  get "/signup" do
    if !logged_in?
      erb :signup
    else
      redirect to '/signup'
    end
  end

  post '/signup' do
    if params[:email] == "" || params[:username] == "" || params[:password] = ""
      redirect to '/singup'
    else
      @user = User.new(email: params["email"], username: params["username"], password_digest: params["password"])
      @user.save
#    session[:user_id] = @user.id
      redirect to '/'
    end
  end


end

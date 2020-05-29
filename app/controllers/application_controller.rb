require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post '/signup' do
    @user = User.new(name: params["name"], username: params["username"], password_digest: params["password"])
    @user.save
    #session[:user_id] = @user.id

    erb :'/team/index'
  end

  post '/' do
    @user = User.find_by(username: params[:username], password_digest: params[:password])
    if @user
      session[:user_id] = @user.id
      erb :test
    else
      redirect '/'
    end
  end

end

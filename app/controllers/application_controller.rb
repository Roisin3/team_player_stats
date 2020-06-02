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


  post '/' do
    @user = User.find_by(username: params[:username], password_digest: params[:password])
    if @user = true
#      session[:user_id] = @user.id
      redirect to '/team/index'
    else
      redirect to '/'
    end
  end

  get '/team/index' do
    erb :"/team/index"
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end


end

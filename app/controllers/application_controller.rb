require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "celeborn"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Team.find_by(id: session[:team_id]) if session[:team_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        session.clear
        redirect to '/users/login'
      end
    end
    

end
end

require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/' do
    team = Team.find_by(:team_name => params[:team_name])
    if team && team.authenticate(params[:password])
      session[:team_id] = team_id.id
      redirect to "/team/show"
    else
      redirect to '/signup'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :signup, locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/team/show'
    end
  end

  post '/signup' do
    if params[:team_name] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @team = Team.new(:team_name => params[:team_name], :email => params[:email], :password_digest => params[:password])
      @team.save
      session[:team_id] = @team.id
      redirect to '/team/show'
    end
  end

  get '/team/show' do
    erb :"team/show"
  end

  helpers do

    def logged_in?
      !!current_team
    end

    def current_team
      @current_team ||= Team.find_by(id: session[:team_id]) if session[:team_id]
    end

  end
end

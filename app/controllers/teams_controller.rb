require './config/environment'

class TeamsController < ApplicationController
  #use Rack::Flash

  get 'team/new' do
    if logged_in?
      redirect "/players"
    else
      erb :'team/new'
    end
  end

  get '/team/login' do
    if logged_in?
      redirect '/players'
    else
      session.clear
      erb :'team/login'
    end
  end

  post '/team' do
    if !Team.find_by(team_name: params[:team_name])
    @team = Team.create[params]
    session[:team_id] = @team.id
      redirect '/players'
    else
      flash[:message] = "A team with that name already exists."
      redirect '/'
    end
  end

  post '/team/login' do
    @team = Team.find_by(team_name: params[:team_name])
    if @user && @user.authenticate(params[:password])
      session[:team_id] = @team.id
      redirect '/players'
    else
      flash[:message] = "The team name or password did not match."
      redirect '/'
    end
  end

  post '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect '/'
    end
  end
  

end

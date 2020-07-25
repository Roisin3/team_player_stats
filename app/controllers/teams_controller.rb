class TeamsController < ApplicationController
    get '/team/:slug' do
        @team = Team.find_by_slug(params[:slug])
        erb :'team/show'
    end

    get '/signup' do
        if !logged_in?
            erb :'teams/create_team'
        else
            redirect to '/players'
        end
    end

    post '/signup' do
        if params[:team_name] == '' || params[:email] == '' || params[:password] == ''
            redirect to '/signup'
        else
            @team = Team.new(:team_name => params[:team_name], :email => params[:email], :password => params[:password])
            @team.save
            session[:team_id] == @team.id
            redirect to '/players'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'teams/login'
        else
            redirect to '/players'
        end
    end

    post '/login' do
        team = Team.find_by(:team_name => params[:team_name])
        if team && team.authenticate(params[:password])
            session[:team_id] = team.id
            redirect to "/players"
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end

end



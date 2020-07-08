class PlayerController < ApplicationController
    get '/players' do
        redirect_if_not_logged_in
        @team = Team.find_by('id' => current_user.id)
        @player = @team.player.ApplicationController

        erb :
    end

    get '/players/new' do
        redirect_if_not_logged_in

        @team = Team.find_by('id' => current_user.id)

        erb :
    end

    post '/players' do
        redirect_if_not_logged_in
        @team = Team.find_by('id' => session[:team_id])

        if params[:name] != ''
            @player = Player.create(params)
            redirect '/players'
        else
            flash[:message] = 'Please enter valid player name'
        end
    end

    patch '/player/:id' do
        @player = Player.find_by_id(params[:id])
         if @player && @player.user == current_user
            @player.name = params[:name]
            @player.position = params[:position]
            @player.games = params[:games]
            @player.goals = params[:goals]
            @player.saves = params[:saves]
            @player.assists = params[:assists]
            @player.blocks = params[:blocks]
            @player.shots = params[:interceptions]
            @player.passes = params[:passes]
            @player.red_cards = params[:red_cards]
            @player.yellow_cards = params[:yellow_cards]
            @player.team_id = current_user.id
            @player.save
         else
            flash[:message] = 'You do not have access to that player'
                redirect '/players'
        end
    
    end


    get '/players/:id/delete' do
        redirect_if_not_logged_in
        @player = Player.find_by_id(params[:id])
        if @player.team_id == current_user.id
            @player.delete
            redirect '/players'
        else
            redirect '/players'
        end
    end

end



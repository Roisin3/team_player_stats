class PlayersController < ApplicationController

    get '/players' do
        if logged_in?
            @player = current_user.players
            erb :'players/players'
        else
            redirect to '/login'
        end
    end

    get '/players/new' do
        if logged_in?
            erb :'players/create_player'
        else
            redirect to '/login'
        end
    end

    post '/players' do
        if logged_in?
            if params[:name] == "" || params[:position] == ""
                redirect to "/players/new"
            else
                @player = current_user.player.build(name: params[:name], position: params[:position], games: params[:games], goals: params[:goals], saves: params[:saves], assists: params[:assists], blocks: params[:blocks], shots: params[:shots], interceptions: params[:interceptions], passes: params[:passes], red_cards: params[:red_cards], yellow_cards: params[:yellow_cards])
                if @player.save
                    redirect to "/players/#{@player.id}"
                else
                    redirect to "/players/new"
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/players/:id' do
        if logged_in?
            @player = Player.find_by_id(params[:id])
            erb :'players/show_player'
        else
            redirect to '/login'
        end
    end

    get '/players/:id/edit' do
        if logged_in?
            @player = Player.find_by_id(params[:id])
            if @player && @player.team == current_user
                erb :'players/edit_player'
            else
                redirect to '/players'
            end
        else
            redirect to '/login'
        end
    end

    patch '/players/:id' do
        if logged_in?
            if params[:name] == "" || params[:position] == ""
                redirect to "/players/#{params[:id]}/edit"
            else
                @player = Player.find_by_id(params[:id])
                if @player && @player.team == current_user
                    if @player.update(name: params[:name], position: params[:position], games: params[:games], goals: params[:goals], saves: params[:saves], assists: params[:assists], blocks: params[:blocks], shots: params[:shots], interceptions: params[:interceptions], passes: params[:passes], red_cards: params[:red_cards], yellow_cards: params[:yellow_cards])
                        redirect to "players/#{@player.id}"
                    else
                        redirect to "/players/#{player.id}/edit"
                    end
                else
                    redirect to '/players'
                end
            end
        else
            redirect to '/login'
        end
    end


    delete '/players/:id/delete' do
        if logged_in?
            @player = Player.find_by_id(params[:id])
            if @player && @player.team == current_user
                @player.delete
            end
            redirect to '/players'
        else
            redirect to '/login'
        end
    end

end


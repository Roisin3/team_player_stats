require './config/environment'

class TeamsController < ApplicationController
  get '/team/:slug' do
   @team = Team.find_by_slug(params[:slug])
   erb :'team/show'
 end



end

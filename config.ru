require_relative './config/environment'

require './config/environment'


use Rack::MethodOverride
#use Rack::Session::Cookie

use TeamsController
use PlayersController
run ApplicationController
require 'sinatra'
require_relative './helpers/view_helpers'

configure :production do
  require 'newrelic_rpm'
end

helpers Sinatra::ViewHelpers

before '/*' do
  cache_control :public, max_age: 86400
end

get '/' do
  erb :index
end

get '/alliance_info' do
  @data = EveDataFetcher::Eve.alliance_info
  @title = 'Alliance info'
  @path = 'alliance_info.json'
  erb :eve_data
end

get '/conquerable_stations' do
  @data = EveDataFetcher::Eve.conquerable_stations
  @title = 'Conquerable Stations'
  erb :eve_data
end

get '/factional_warfare_stats' do
  @data = EveDataFetcher::Eve.factional_warfare_stats
  @title = 'Factional Warfare Stats'
  erb :eve_data
end

get '/reference_types' do
  @data = EveDataFetcher::Eve.reference_types
  @title = 'Reference Types'
  erb :eve_data
end

get '/skill_tree' do
  @data = EveDataFetcher::Eve.skill_tree
  @title = 'Skill Tree'
  erb :skill_data
end


# JSON requests
get '/server_stats.json' do
  status 200
  content_type :json
  EveDataFetcher::Misc.server_status.to_json
end


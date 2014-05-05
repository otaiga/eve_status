require 'sinatra'
require_relative './helpers/view_helpers'

configure :production do
  require 'newrelic_rpm'
end

helpers Sinatra::ViewHelpers

get '/' do
  erb :index
end

get '/alliance_info' do
  cache_control :public, max_age: 86400
  @data = EveDataFetcher::Eve.alliance_info
  @title = 'Alliance info'
  @path = 'alliance_info.json'
  erb :eve_data
end

get '/conquerable_stations' do
  cache_control :public, max_age: 86400
  @data = EveDataFetcher::Eve.conquerable_stations
  @title = 'Conquerable Stations'
  erb :eve_data
end

get '/factional_warfare_stats' do
  cache_control :public, max_age: 86400
  @data = EveDataFetcher::Eve.factional_warfare_stats
  @title = 'Factional Warfare Stats'
  erb :eve_data
end

get '/reference_types' do
  cache_control :public, max_age: 86400
  @data = EveDataFetcher::Eve.reference_types
  @title = 'Reference Types'
  erb :eve_data
end

get '/skill_tree' do
  cache_control :public, max_age: 3600
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


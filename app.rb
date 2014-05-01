require 'sinatra'
require_relative './helpers/view_helpers'

configure :production do
  require 'newrelic_rpm'
end

helpers Sinatra::ViewHelpers

before '/*' do
  cache_control :public, max_age: 3600
end

get '/' do
  erb :index
end

get '/alliance_info' do
  @data = EveDataFetcher.alliance_info
  @title = 'Alliance info'
  erb :eve_data
end

get '/conquerable_stations' do
  @data = EveDataFetcher.conquerable_stations
  @title = 'Conquerable Stations'
  erb :eve_data
end

get '/factional_warfare_stats' do
  @data = EveDataFetcher.factional_warfare_stats
  @title = 'Factional Warfare Stats'
  erb :eve_data
end

get '/reference_types' do
  @data = EveDataFetcher.reference_types
  @title = 'Reference Types'
  erb :eve_data
end

get '/skill_tree' do
  @data = EveDataFetcher.skill_tree
  @title = 'Skill Tree'
  erb :skill_data
end

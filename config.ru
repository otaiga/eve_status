require './app.rb'
require './lib/eve_data_fetcher'
require 'memcachier'
require 'dalli'

if memcache_servers = ENV["MEMCACHIER_SERVERS"]
  use Rack::Cache,
    verbose: true,
    metastore:   "memcached://#{memcache_servers}",
    entitystore: "memcached://#{memcache_servers}"
end

run Sinatra::Application
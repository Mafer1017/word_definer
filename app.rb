require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
require('./lib/song')
also_reload('lib/**/*.rb')
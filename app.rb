require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/song')
also_reload('lib/**/*.rb')
require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('./lib/definition.rb')
also_reload('lib/**/*.rb')


get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  erb(:word)
end

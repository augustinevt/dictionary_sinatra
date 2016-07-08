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

  @word = Word.find(params[:id].to_i)
  new_definition_one = Definition.new({body: 'A greeting'})
  new_definition_two = Definition.new({body: 'An alert'})
  @word.add_definition(new_definition_one)
  @word.add_definition(new_definition_two)

  erb(:word)
end

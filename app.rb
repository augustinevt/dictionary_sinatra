require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('./lib/definition.rb')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/new_word') do
  erb(:new_word)
end

post('/create_word') do
  word = Word.new({name: params[:name]})
  redirect "/word/#{word.id}"
end

post('/create_definition') do
  Word.find(params[:id].to_i).add_definition(Definition.new({body: params[:definition]}))
  redirect "word/#{params[:id].to_i}"
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

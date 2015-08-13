require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/hangman')

get('/') do
	@@word = Word.new('awesome')
	@@masked_word = @@word.masked_word()
  erb(:index)
end

post('/guess') do
  guess = params.fetch('guess')
  @@masked_word = @@word.check(guess)
  erb(:index)
end

post('/play_word') do
  play_word = params.fetch('play_word')
  @@word = Word.new(play_word)
  @@masked_word = @@word.masked_word()
  erb(:index)
end

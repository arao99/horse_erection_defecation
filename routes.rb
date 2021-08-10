require 'sinatra'
require './database'

get '/' do
  erb :index
end

get '/post' do
  'post!'
end

post '/post_record' do
  'post_record!'
end

get '/browse' do
  'browse!'
end

get '/readme' do
  erb :readme
end

get '/history' do
  erb :history
end

get '/todo' do
  erb :todo
end

not_found do
  '404!'
end

error do
  'error!'
end

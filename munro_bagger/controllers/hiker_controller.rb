require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/hiker.rb')

get '/hikers' do
  @hikers = Hiker.all()
  erb (:"hikers/index")
end

get '/hikers/new' do
  erb(:"hikers/new")
end

post '/hikers' do
  hiker = Hiker.new(params)
  hiker.save
  redirect to("/hikers")
end

get '/hikers/:id' do
  @hiker = Hiker.find_by_id(params['id'].to_i)
  erb( :"hikers/show" )
end

post '/hikers/:id/delete' do
  hiker = Hiker.find_by_id(params[:id])
  hiker.delete()
  redirect to("/hikers")
end

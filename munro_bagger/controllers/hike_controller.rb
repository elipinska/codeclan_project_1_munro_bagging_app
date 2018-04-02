require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/hike.rb' )
require_relative( '../models/hiker.rb' )
require_relative( '../models/munro.rb' )

get '/hikes' do
  @hikes = Hike.all
  erb(:"hikes/index")
end

get '/hikes/new' do
  @hikers = Hiker.all()
  @munros = Munro.all
  erb(:"hikes/new")
end

post '/hikes' do
  hike = Hike.new(params)
  hike.save
  redirect to("/hikes")
end

post '/hikes/:id/delete' do
  Hike.delete(params[:id])
  redirect to("/hikes")
end

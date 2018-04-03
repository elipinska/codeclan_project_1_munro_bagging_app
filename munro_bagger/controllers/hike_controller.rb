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
  hiker = Hiker.find_by_id(hike.hiker_id)
  if hiker.munro_goal == hiker.unique_hikes_no
    redirect to("/hikers/#{hiker.id}/goal_completed")
  else
    redirect to("/hikes")
  end
end

get '/hikes/:id/edit' do
  @hikers = Hiker.all()
  @munros = Munro.all()
  @hike = Hike.find_by_id(params['id'])
  erb(:"hikes/edit")
end

post '/hikes/:id' do
  hike = Hike.new(params)
  hike.update
  redirect to "/hikes"
end

post '/hikes/:id/delete' do
  hike = Hike.find_by_id(params[:id])
  hike.delete()
  redirect to("/hikes")
end

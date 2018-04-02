require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/munro.rb')

get '/munros' do
  @munros = Munro.all()
  erb (:"munros/index")
end

get '/munros/:id' do
  @munro = Munro.find_by_id(params['id'].to_i)
  erb( :"munros/show" )
end

post '/munros/:id/delete' do
  munro = Munro.find_by_id(params[:id])
  munro.delete()
  redirect to("/munros")
end

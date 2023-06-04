class ApplicationController < Sinatra::Base

  # add routes
  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/bakeries' do
    # get all the games from the database
    games = Bakery.all
    # return a JSON response with an array of all the game data
    games.to_json
  end

  get '/bakeries/:id' do

    game = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    game.to_json
  end



  get '/baked_goods/by_price' do
    data = BakedGood.order(price: :desc)
    data.to_json
  end

  get '/baked_goods/most_expensive' do
    data = BakedGood.find_by(price: BakedGood.maximum("price"))
    data.to_json
  end

  get '/baked_goods' do
    baked_good = BakedGood.all
    baked_good.to_json
  end







end

require 'gossip'
require 'comment'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  get '/gossips/:id' do
    erb :show, locals: {gossip: Gossip.find(params['id'].to_i), id: params["id"], comments: Comment.all(params['id'])}
  end
  get '/gossips/:id/edit/' do
    erb :edit, locals: {id: params["id"]}
  end
  post '/gossips/:id/edit/' do
    Gossip.update(params["gossip_author"], params["gossip_content"], params["id"])
    redirect '/'
  end
  get '/gossips/:id/comment/' do
    erb :comment, locals: {id: params["id"]}
  end
  post '/gossips/:id/comment/' do
    Comment.new(params["gossip_author"], params["gossip_content"], params["id"]).save
    redirect '/'
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
end
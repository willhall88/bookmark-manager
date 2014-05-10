require 'sinatra/base'
require 'data_mapper'
require './lib/link'
require './lib/tag'
require './lib/user'
require './data_mapper_setup'




class Bookmark_manager < Sinatra::Base
  enable :sessions
  set :session_secret, 'this is secret'

  get '/' do
    @links = Link.all
    @tags = Tag.all

    erb :index
  end

  get '/tags/:name' do
    tag = Tag.first(:name => params[:name])
    # puts "I am here"
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(:name => params[:name], 
                :email => params[:email], 
                :password => params[:password])
    session[:user_id] = user.id
    redirect to ('/')
  end

  post '/' do
    tags = params["tag"].split(",").map{|tag| Tag.first_or_create(:name => tag)}
    Link.create(:url => params["url"], :title => params["title"], :tags => tags)
    redirect to('/')
  end

  helpers do

    def current_user    
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end


end


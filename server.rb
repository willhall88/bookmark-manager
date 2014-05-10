require 'sinatra/base'
require 'data_mapper'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require './lib/link'
require './lib/tag'
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!



class Bookmark_manager < Sinatra::Base
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
    User.create(:name => params[:name], 
                :email => params[:email], 
                :password => params[:password])
    redirect to ('/')
  end

  post '/' do
    tags = params["tag"].split(",").map{|tag| Tag.first_or_create(:name => tag)}
    Link.create(:url => params["url"], :title => params["title"], :tags => tags)
    redirect to('/')
  end

end

require 'sinatra/base'

class Bookmark_manager < Sinatra::Base
  get '/' do
    'Hello Bookmark_manager!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

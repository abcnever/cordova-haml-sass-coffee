require 'sinatra'

set :public_dir, File.dirname(__FILE__) + '/www'

get '/*'  do
  send_file File.expand_path('index.html', settings.public_dir)
end

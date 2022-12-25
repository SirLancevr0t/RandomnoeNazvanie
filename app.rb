require 'rubygems'
require 'sinatra'

configure :production do
  enable :reloader
end

get '/' do
  erb :index
end

post '/' do
  @user_name = params[:user_name]
  @user_phome = params[:user_phome]
  @date_time = params[:date_time]

  @title = 'Thanks!'
  @message = "Thank you, #{@user_name}, we'll be waiting!"

  f = File.open './public/users.txt', 'a'
  f.write "User; #{@user_name}, Phone: #{@user_phome}, Date and time: #{@date_time}"
  f.close

  erb :message
end

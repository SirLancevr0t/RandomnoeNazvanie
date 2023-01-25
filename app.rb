require 'rubygems'
require 'sinatra'

configure :production do
  enable :reloader
end

get '/visit' do
  erb :visit
end

post '/visit' do
  @user_name = params[:user_name]
  @user_phone = params[:user_phone]
  @date_time = params[:date_time]
  @master_name = params[:master_name]

  hh = { :user_name => 'Enter your name.',
    :user_phone => 'Enter your phone.',
    :date_time => 'Enter correct date and time.',
    :master_name => 'Choose your master.' }
  hh.each do |key, value|
    if params[key] == ''
      @error = hh[key]
      return erb :visit
    end
  end

  @title = 'The appointment has been created!'
  @message = "Thank you, #{@user_name}, we'll be waiting!"

  f = File.open './public/users.txt', 'a'
  f.write " User: #{@user_name}, Phone: #{@user_phone}, Date and time: #{@date_time}, Master: #{@master_name}"
  f.close

  erb :message
end

get '/about' do
  erb :about
end

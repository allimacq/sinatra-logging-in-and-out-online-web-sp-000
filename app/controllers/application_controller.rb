require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    
    if @user != nil
      session[:user_id] = @user.id
      session[:id] = 1
      redirect to "/account"
    else
      erb :error
    end

  end

  get '/account' do
    if session[:id] == 1
      erb :account
    else
      erb :error
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if Helpers.is_logged_in?(session) == false
      erb :error
    else
      @user = Helpers.current_user(session)
      erb :account
    end
  end

  get '/logout' do
    session.clear
    
    redirect to '/'
  end


end


require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "trackyoreciept"
  end


  get '/' do
    if logged_in
      redirect "/home"
    else
      erb :index
    end
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def users_name
      "#{current_user.first_name} #{current_user.last_name}"
    end

    def current_user
      User.find(session[:user_id])
    end

    def edited_date(date)
      date.strftime("%b. %d %Y")
    end

    def recent_purchases
      current_user.items.last(10)
    end

    def capitalize_store_name(store_name)
      store_name.split(" ").collect {|word| word.downcase.capitalize}.join(" ")
    end

  end

end

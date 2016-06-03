class UserController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect "/home"
    else
      erb :"user/signup"
    end
  end

  get "/home" do
    redirect_if_not_logged_in
    @user = User.find_by_id(session[:user_id])
    erb :"user/show"
  end

  get "/login" do
    if logged_in?
      redirect "/home"
    else
      erb :"user/login"
    end
  end

  get "/logout" do
    if logged_in?
      session.destroy
      redirect "/"
    else
      redirect "/login"
    end
  end

  post "/signup" do
    @user = User.new(params)
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/signup"
    else
      @user.save
      session[:user_id] = @user.id
      redirect "/home"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/home"
    else
      redirect "/login"
    end
  end

end

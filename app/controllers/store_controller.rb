class StoreController < ApplicationController

  get "/stores" do
    redirect_if_not_logged_in
    @user = User.find_by_id(session[:user_id])
    @stores = @user.stores
    erb :"stores/index"
  end

end

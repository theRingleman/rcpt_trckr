class StoreController < ApplicationController

  get "/stores" do
    redirect_if_not_logged_in
    @user = User.find_by_id(session[:user_id])
    @stores = @user.stores
    erb :"stores/index"
  end

  get "/stores/:id" do
    redirect_if_not_logged_in
    @store = Store.find_by_id(params[:id])
    @receipts = @store.receipts.sort_by &:created_at
    erb :"stores/show"
  end

end

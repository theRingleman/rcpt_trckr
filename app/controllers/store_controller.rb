class StoreController < ApplicationController

  get "/stores" do
    redirect_if_not_logged_in
    @user = current_user
    @stores = @user.stores
    erb :"stores/index"
  end

  get "/stores/:id" do
    redirect_if_not_logged_in
    @store = Store.find_by_id(params[:id])
    @receipts = @store.receipts.sort_by &:created_at
    erb :"stores/show"
  end

  get "/stores/:id/delete" do
    redirect_if_not_logged_in
    @store = Store.find(params[:id])
    erb :"stores/delete"
  end

  get "/stores/:id/edit" do
    redirect_if_not_logged_in
    @store = Store.find(params[:id])
    erb :"stores/edit"
  end

  post "/stores/:id/edit" do
    redirect_if_not_logged_in
    @store = Store.find(params[:id])
    @store.update(name: params[:name])
    @store.save
    redirect "/stores"
  end

  post "/stores/:id/delete" do
    redirect_if_not_logged_in
    @store = Store.find(params[:id])
    @store.receipts.each {|receipt| receipt.items.each {|item| item.delete}}
    @store.receipts.each {|receipt| receipt.delete}
    @store.delete
    redirect "/stores"
  end

end

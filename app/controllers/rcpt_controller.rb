require "pry"

class RCPTController < ApplicationController

  get "/receipts" do
    redirect_if_not_logged_in
    @receipts = User.find_by_id(session[:user_id]).receipts
    erb :"receipt/index"
  end

  get "/receipts/new" do
    redirect_if_not_logged_in
    erb :"receipt/new"
  end

  get "/receipts/:id" do
    redirect_if_not_logged_in
    @receipt = Receipt.find_by_id(params[:id])
    erb :"receipt/show"
  end

  get "/receipts/:id/items/new" do
    @receipt = Receipt.find_by_id(params[:id])
    erb :"items/new"
  end

  get "receipts/:id/items" do
    redirect_if_not_logged_in
    erb :"items/show"
  end

  get "/receipts/:id/delete" do
    redirect_if_not_logged_in
    @receipt = Receipt.find(params[:id])
    erb :"receipt/delete"
  end

  post "/receipts/new" do
    # binding.pry
    if params[:store][:name] == "" || params[:item_number] == ""
      @error = "Sorry you missed something."
      erb :"receipt/new"
    else
      store = Store.find_or_create_by(name: capitalize_store_name(params[:store][:name]))
      @receipt = current_user.receipts.create(params[:receipt], store: store)
      # @receipt = Receipt.new(params[:receipt])
      # @receipt.user_id = session[:user_id]
      # @receipt.store_id = store.id
      # @receipt.save
      # redirect "/receipts/#{@receipt.id}/items/new"
    end
  end

  post "/receipts/:id/items/new" do
    @receipt = Receipt.find_by_id(params[:id])
    params[:item].each do |item|
      new_item = Item.new(item)
      new_item.receipt_id = @receipt.id
      new_item.save
    end
    redirect "/receipts"
  end

  post "/receipts/:id/delete" do
    redirect_if_not_logged_in
    @receipt = Receipt.find(params[:id])
    @receipt.items.each {|item| item.delete}
    @receipt.delete
    redirect "/receipts"
  end

end

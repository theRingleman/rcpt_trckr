require "pry"

class RCPTController < ApplicationController

  get "/receipts" do
    redirect_if_not_logged_in
    @receipts = Receipt.all
    erb :"receipt/index" 
  end 

  get "/receipts/new" do
    redirect_if_not_logged_in
    erb :"/receipt/new"
  end

  get "/receipts/:id" do
    redirect_if_not_logged_in
    erb :"receipt/show"
  end

  post "/receipts/new" do
    store = Store.find_or_create_by(name: params[:store][:name])
    @receipt = Receipt.new(params[:receipt])
    @receipt.user_id = session[:user_id]
    @receipt.store_id = store.id
    @receipt.save
    redirect "/receipts"
  end

end
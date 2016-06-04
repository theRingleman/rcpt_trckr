class ItemController < ApplicationController

  get "/item/:id/edit" do
    redirect_if_not_logged_in
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  post "/item/:id/edit" do
    redirect_if_not_logged_in
    @item = Item.find(params[:id])
    @receipt = @item.receipt
    @item.update(name: params[:name], price: params[:price])
    @item.save
    redirect "/receipts/#{@receipt.id}"
  end

end

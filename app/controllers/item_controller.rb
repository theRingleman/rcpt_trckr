class ItemController < ApplicationController

  get "/item/:id/edit" do
    redirect_if_not_logged_in
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

end

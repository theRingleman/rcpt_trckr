class RCPTController < ApplicationController

  get "/receipts" do
    if logged_in?
      erb :"receipts/index"  
    else
      redirect "/login"
    end
  end 

  get "/receipts/new" do
    if logged_in?
      erb :"/receipts/new"
    else
      redirect "/login"
    end
  end

end
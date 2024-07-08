class CoinController < ApplicationController

 def index
  coin = Coin.all.order(:id) 
  render json: coin
 end

 def show
  coin Coin.find_by(id: params[:id])
  render json: coin
 end

 def create
  
end

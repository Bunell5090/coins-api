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
  coin = Coin.new(
    denomination: params[:denomination],
    coin_type: params[:coin_type],
    year: params[:year],
    mint: params[:mint],
    circulated: params[:circulated],
    proof: params[:proof],
    graded: params[:graded],
    grading_company: params[:grading_company],
    cert_number: params[:cert_number]
  )
  if coin.save
    render json: coin, status: :created
  else
    render json: coin.errors, status: :unprocessable_entity
  end
  
end

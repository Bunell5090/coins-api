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
    render json: { message: "Coin added successfully" }, status: :created
  else
    render json: { errors: coin.errors.full_messages }, status: :bad_request
  end
  
  def update
    id = params[:id]
    coin = Coin.find_by(id: id)
    coin.denomination = params["denomination"] || coin.denomination
    coin.coin_type = params["coin_type"] || coin.coin_type
    coin.year = params["year"] || coin.year
    coin.mint = params["mint"] || coin.mint
    coin.circulated = params["circulated"] || coin.circulated
    coin.proof = params["proof"] || coin.proof
    coin.graded = params["graded"] || coin.graded
    coin.grading_company = params["grading_company"] || coin.grading_company
    coin.cert_number = params["cert_number"] || coin.cert_number
    if coin.save #happy path
      render json: coin
    else #sad path
      render json: {error_messages: coin.errors.full_messages}, status: 422
    end
  end

  def destroy
    customer_id = params["id"]
    coin = Coin.find_by(id: customer_id)
    coin.destroy
    render json: {message: "Coin has been deleted!"}
  end
end

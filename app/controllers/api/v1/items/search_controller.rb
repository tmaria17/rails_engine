class Api::V1::Items::SearchController < ApplicationController
  def show
   # binding.pry
    render json: Item.find_by(search_params)
  end

  def index
    render json: Item.where(search_params)
  end



  private

    def search_params
      params[:created_at] = params[:created_at].to_s if params[:created_at]
      params[:updated_at] = params[:updated_at].to_s if params[:updated_at]
       params[:unit_price] = params[:unit_price].delete('.').to_i if params[:unit_price]
       params.permit(:id, :name, :description, :unit_price, :merchant_id, :updated_at, :created_at)
    end
end

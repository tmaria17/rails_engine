class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: Item.find_by(search_params)
  end

  def index
    render json: Item.where(search_params)
  end



  private

    def search_params
      params[:unit_price] = params[:unit_price].delete('.').to_i if params[:unit_price]
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :updated_at, :created_at)
    end
end

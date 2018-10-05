class Api::V1::Merchants::MostItemsController < ApplicationController

 def index
   render json: Merchant.most_items(search_params[:quantity])
 end

end

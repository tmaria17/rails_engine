require 'rails_helper'

 describe 'merchant response ' do
   it 'should return x merchants with most items' do
     get '/api/v1/merchants/most_items?/quantity=2'

     expect(response).to be_successful
   end

   it 'should return x merchants with most revenue' do
     get '/api/v1/merchants/most_revenue?/quantity=5'

     expect(response).to be_successful
   end

   it ' returns the customer who has conducted the most total number of successful transactions' do
     merchant = create(:merchant)

     get "/api/v1/merchants/#{merchant.id}/favorite_customer"

     expect(response).to be_successful
   end
end

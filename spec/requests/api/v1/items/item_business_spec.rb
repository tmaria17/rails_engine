require 'rails_helper'

 describe 'item response ' do
   it 'should return x items with most revenue' do
     get '/api/v1/items/most_revenue?/quantity=5'

     expect(response).to be_successful
   end
   it 'should return the top items' do
     get '/api/v1/items/most_items?/quantity=2'

     expect(response).to be_successful
   end

   it 'should return the best day for the item' do
     get '/api/v1/items/1/best_day'

     expect(response).to be_successful
   end
 end

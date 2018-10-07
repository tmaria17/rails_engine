require 'rails_helper'

 describe 'item response ' do
   it 'should return x items with most revenue' do
     get '/api/v1/items/most_revenue?/quantity=5'

     expect(response).to be_successful
   end
 end

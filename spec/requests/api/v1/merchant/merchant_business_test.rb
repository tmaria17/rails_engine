require 'rails_helper'

 describe 'merchant response ' do
   it 'should return x merchants with most items' do
     get '/api/v1/merchants/most_items?/quantity=2'

     expect(response).to be_successful
   end

   # it  ' should return the total revenue for that merchant across successful transactions '
   #   get '/api/v1/merchants/2/revenue'
   #
   #   expect(response).to be_successful
   # end




end

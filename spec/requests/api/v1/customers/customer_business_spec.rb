require 'rails_helper'

 describe 'customer response ' do
   it 'returns a merchant where the customer has conducted the most successful transactions' do
     get '/api/v1/customers/1/favorite_merchant'

     expect(response).to be_successful
   end
end

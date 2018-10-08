require 'rails_helper'

 describe 'customer response ' do
   it 'returns a merchant where the customer has conducted the most successful transactions' do
     customer = create(:customer)

     get "/api/v1/customers/#{customer.id}/favorite_merchant"

     expect(response).to be_successful
   end
end

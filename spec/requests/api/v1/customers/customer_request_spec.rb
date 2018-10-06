require 'rails_helper'

describe 'customers api' do
  it 'sends a list of customers' do
    create_list(:customer, 20)

    get '/api/v1/customers'

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(20)
  end

  it 'finds one customer'do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end
end

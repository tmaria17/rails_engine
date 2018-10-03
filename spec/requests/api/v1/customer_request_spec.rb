require 'rails_helper'

describe 'customers api' do
  it 'sends a list of customers' do
    create_list(:customer, 20)

    get '/api/v1/customers'

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(20)
  end

  # it 'finds one item'do
  #
  #   get "/api/v1/items/#{item_id}"
  #
  #   item = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(item["id"]).to eq(item_id)
  # end
end

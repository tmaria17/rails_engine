require 'rails_helper'

describe 'Merchant api relationships' do
  it 'returns a collection of items belonging to merchant'do
    merchant = create(:merchant)
    create_list(:item, 20, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(20)
  end
end

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

  it 'returns merchants invoices' do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(10)
  end
end

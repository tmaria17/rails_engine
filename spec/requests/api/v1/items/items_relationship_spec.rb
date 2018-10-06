require 'rails_helper'

describe 'Item relationships' do
  it 'returns all invoice items for an invoice'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice  = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)
    item1 = create(:item, merchant_id: merchant_id)
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice.id, item_id: item1.id)
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice.id, item_id: item1.id)

    get "/api/v1/items/#{item1.id}/invoice_items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
  end


end

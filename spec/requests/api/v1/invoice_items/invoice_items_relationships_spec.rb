require 'rails_helper'

describe 'Invoice Items relationships' do
  it 'returns the invoice for an invoice item'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice1 = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)

    item = create(:item, merchant_id: merchant_id)

    invoice_item = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice1.id, item_id: item.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    # binding.pry
    expect(invoice["id"]).to eq(invoice1.id)
  end

  it 'returns the invoice for an invoice item'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice1 = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)

    item1 = create(:item, merchant_id: merchant_id)

    invoice_item = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice1.id, item_id: item1.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end



end

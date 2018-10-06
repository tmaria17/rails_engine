require 'rails_helper'

describe 'Invoice relationships' do
  it 'returns all transactions for an invoice'do
    merchant  = create(:merchant)
    customer  = create(:customer)
    invoice  = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)


    create_list(:transaction, 5, invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(5)
  end
  it 'returns the merchant for an invoice'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice  = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq(merchant_id)
  end
  it 'returns all items for an invoice'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice  = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)
    item1 = create(:item, merchant_id: merchant_id)
    item2 = create(:item, merchant_id: merchant_id)
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice.id, item_id: item1.id)
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice.id, item_id: item2.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(2)
  end

  it 'returns all invoice items for an invoice'do
    merchant_id  = create(:merchant).id
    customer_id  = create(:customer).id
    invoice  = create(:invoice, merchant_id: merchant_id, customer_id: customer_id)
    item1 = create(:item, merchant_id: merchant_id)
    item2 = create(:item, merchant_id: merchant_id)
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice.id, item_id: item1.id)
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price: 12, invoice_id: invoice.id, item_id: item2.id)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)
  end

end

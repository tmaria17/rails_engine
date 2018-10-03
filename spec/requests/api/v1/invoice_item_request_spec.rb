require 'rails_helper'

describe 'invoice_items api' do

  it 'sends a list of invoice_items' do
    merchant = Merchant.create!(name: "Ollivanders")
    customer = Customer.create!(first_name: "Harry", last_name: "Potter")
    invoice = Invoice.create!(status: "pending", merchant_id: merchant.id , customer_id: customer.id)
    item = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )
    invoice_item1 = InvoiceItem.create!(quantity:1, unit_price:1200, invoice_id: invoice.id, item_id: item.id)
    invoice_item2 = InvoiceItem.create!(quantity:2, unit_price:1200, invoice_id: invoice.id, item_id: item.id)



    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items.count).to eq(2)
  end

   it 'finds one invoice item' do
     merchant = Merchant.create!(name: "Ollivanders")
     customer = Customer.create!(first_name: "Harry", last_name: "Potter")
     invoice = Invoice.create!(status: "pending", merchant_id: merchant.id , customer_id: customer.id)
     item = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )
     invoice_item = InvoiceItem.create!(quantity:1, unit_price:1200, invoice_id: invoice.id, item_id: item.id)
     id = invoice_item.id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["id"]).to eq(id)
  end
end

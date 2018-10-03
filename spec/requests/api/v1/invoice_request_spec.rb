require 'rails_helper'

describe 'invoices api' do
  it 'sends a list of invoices' do
    merchant1 = Merchant.create!(name: "Ollivanders")
    merchant2 = Merchant.create!(name: "Hogs Head")
    customer = Customer.create!(first_name: "Harry", last_name: "Potter")
    invoice1 = Invoice.create!(status: "pending", merchant: merchant1 , customer: customer)
    invoice2 = Invoice.create!(status: "pending", merchant: merchant2 , customer: customer )

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(2)
  end

   it 'finds one invoice' do
    merchant1 = Merchant.create!(name: "Ollivanders")
    customer = Customer.create!(first_name: "Harry", last_name: "Potter")
    invoice1 = Invoice.create!(status: "pending", merchant: merchant1 , customer: customer)
    id = invoice1.id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["id"]).to eq(id)
  end
end

require 'rails_helper'

describe 'Transactions api' do
  it 'sends a list of transactions' do
    merchant = Merchant.create!(name: "Ollivanders")
    customer = Customer.create!(first_name: "Harry", last_name: "Potter")
    invoice = Invoice.create!(status: "pending", merchant_id: merchant.id , customer_id: customer.id)

    transaction1 = Transaction.create!(invoice_id: invoice.id, credit_card_number: "34", credit_card_expiration_date: "2332234", result: "pass")
    transaction2 = Transaction.create!(invoice_id: invoice.id, credit_card_number: "33", credit_card_expiration_date: "2332234", result: "pass")


    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(2)
  end

  it 'finds one transaction'do
    merchant = Merchant.create!(name: "Ollivanders")
    customer = Customer.create!(first_name: "Harry", last_name: "Potter")
    invoice = Invoice.create!(status: "pending", merchant_id: merchant.id , customer_id: customer.id)
    transaction = Transaction.create!(invoice_id: invoice.id, credit_card_number: "34", credit_card_expiration_date: "2332234", result: "pass")
    id = transaction.id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(id)
  end
end

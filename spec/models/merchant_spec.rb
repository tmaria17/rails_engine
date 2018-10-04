require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:customers).through(:invoices) }
  end

  describe 'class methods' do
    it 'should return top merchants by revenue' do
      customer_id = create(:customer).id
      merchant1 = Merchant.create!(name: "Houses For Animals")
      merchant2= Merchant.create!(name: "Houses For More Animals")
      merchant3= Merchant.create!(name: "Houses For the Most Animals")
      item1 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant1.id )
      item2 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant1.id )
      item3 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant2.id )
      item4 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant3.id )

      invoice1 = Invoice.create!(status: "success", merchant_id: merchant1.id , customer_id: customer_id)
      invoice2 = Invoice.create!(status: "success", merchant_id: merchant1.id , customer_id: customer_id)
      invoice3= Invoice.create!(status: "success", merchant_id: merchant2.id , customer_id: customer_id)
      invoice4 = Invoice.create!(status: "success", merchant_id: merchant3.id , customer_id: customer_id)

      invoice_item1 = InvoiceItem.create!(quantity:1, unit_price:1200, invoice_id: invoice1.id, item_id: item1.id)
      invoice_item2 = InvoiceItem.create!(quantity:2, unit_price:1200, invoice_id: invoice1.id, item_id: item2.id)
      invoice_item2 = InvoiceItem.create!(quantity:2, unit_price:1200, invoice_id: invoice2.id, item_id: item3.id)
      invoice_item2 = InvoiceItem.create!(quantity:2, unit_price:1200, invoice_id: invoice3.id, item_id: item4.id)
      invoice_item2 = InvoiceItem.create!(quantity:2, unit_price:1200, invoice_id: invoice1.id, item_id: item2.id)


      transaction1 = Transaction.create!(invoice_id: invoice1.id, credit_card_number: "34", credit_card_expiration_date: "2332234", result: "success")
      transaction2 = Transaction.create!(invoice_id: invoice2.id, credit_card_number: "33", credit_card_expiration_date: "2332234", result: "success")
      transaction3 = Transaction.create!(invoice_id: invoice3.id, credit_card_number: "33", credit_card_expiration_date: "2332234", result: "success")
      transaction4 = Transaction.create!(invoice_id: invoice4.id, credit_card_number: "33", credit_card_expiration_date: "2332234", result: "success")

      expect(Merchant.most_items(2)).to eq ([merchant1,merchant2])
    end
  end
end

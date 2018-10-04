require 'csv'
namespace :import do
  desc "TODO"
  task customers: :environment do
    CSV.foreach('./db/data/customers.csv', headers: true) do |row|
    Customer.create(row.to_h)
   end
   puts "Customers created!"
  end

  desc "TODO"
  task invoice_items: :environment do
    CSV.foreach('./db/data/invoice_items.csv', headers: true) do |row|
    InvoiceItem.create(row.to_h)
   end
   puts "Invoice items created!"
  end

  desc "TODO"
  task invoices: :environment do
    CSV.foreach('./db/data/invoices.csv', headers: true) do |row|
    Invoice.create(row.to_h)
   end
   puts "Invoices created!"
  end

  desc "TODO"
  task items: :environment do
    CSV.foreach('./db/data/items.csv', headers: true) do |row|
    Item.create(row.to_h)
   end
   puts "Items created!"
  end

  desc "TODO"
  task merchants: :environment do
    CSV.foreach('./db/data/merchants.csv', headers: true) do |row|
    Merchant.create(row.to_h)
   end
  end

  desc "TODO"
  task transactions: :environment do
    CSV.foreach('./db/data/transactions.csv', headers: true, header_converters: :symbol) do |row|
        Transaction.create!(
          id:                           row[:id],
          invoice_id:                   row[:invoice_id],
          credit_card_number:           row[:credit_card_number],
          result:                       row[:result],
          created_at:                   row[:created_at],
          updated_at:                   row[:updated_at]
        )
    end
   puts " #{Transaction.count} Transactions created!"
  end

end

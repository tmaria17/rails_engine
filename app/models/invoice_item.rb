class InvoiceItem < ApplicationRecord
  belongs_to :merchant
  belongs_to :ccustomer
end

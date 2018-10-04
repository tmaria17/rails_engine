class Merchant < ApplicationRecord
  has_many  :items
  has_many  :invoices
  has_many  :customers, through: :invoices
  validates_presence_of :name

  def self.total_revenue(limit)
    .joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id)
    .limit(limit)
  end
end

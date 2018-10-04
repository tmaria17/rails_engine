class Merchant < ApplicationRecord
  has_many  :items
  has_many  :invoices
  has_many :invoice_items, through: :invoices
  has_many  :customers, through: :invoices
  validates_presence_of :name, :updated_at, :created_at

  def self.total_revenue(quantity)
    joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .order("sum(invoice_items.quantity) DESC")
    .group(:id)
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id)
    .limit(quantity)

  end
end

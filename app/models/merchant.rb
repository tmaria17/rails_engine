class Merchant < ApplicationRecord
  has_many  :items
  has_many  :invoices
  has_many :invoice_items, through: :invoices
  has_many  :customers, through: :invoices
  validates_presence_of :name



  def self.most_revenue(quantity)
    Merchant.joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id)
    .limit(quantity)
  end

  def self.most_items(quantity)
    Merchant.joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .order("sum(invoice_items.quantity) DESC")
    .group(:id)
    .limit(quantity)
  end
  def self.favorite_customer(merchant_id)
    Customer
    .select("customers.*, count(transactions.id) AS count")
    .joins(:transactions, :merchants)
    .group(:id)
    .where(transactions: {result: "success"}, merchants: {id: merchant_id})
    .order("count DESC")
    .limit(1)
    .first
  end
end

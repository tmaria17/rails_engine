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
  #
  # def revenue_by_date(date)
  #   # date = date.to_date
  #
  #   invoices.select("sum(invoice_items.quantity)")
  #   .joins(invoice_items: [:transactions])
  #   .where(transactions: {result: "success"})
  #   .where("invoices.created_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)
  #   .limit(1)
  #   .take
  # end

  # def self.total_revenue(date)
  #   Merchant.joins(invoice_items: [:transactions])
  #   .where(transactions: {result: "success"})
  #   .where(invoices.updated_at = date)
  #   .sum('quantity*unit_price')
  #
  # end
end

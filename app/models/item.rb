class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
   default_scope { order(id: :asc) }


  def self.most_revenue(quantity)
    Item.joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id)
    .limit(quantity)
  end

  # def self.most_items
  #   Item.joins(invoices: [:invoice_items, :transactions])
  #   .where(transactions: {result: "success"})
  #   .
  #
  #
  # end




end

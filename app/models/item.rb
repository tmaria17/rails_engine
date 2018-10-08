class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
   default_scope { order(id: :asc) }


  def self.most_revenue(quantity)
    Item.unscoped.joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .select("sum(invoice_items.quantity * invoice_items.unit_price) as revenue, items.*")
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.most_items(quantity)
    Item.unscoped.joins(:invoice_items)
    .select('sum(invoice_items.quantity) AS sold_items, items.*')
    .group(:id)
    .order('sold_items DESC')
    .limit(quantity)
  end
end

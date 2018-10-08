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
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id)
    .limit(quantity)
  end

  def self.most_items(quantity)
    Item.unscoped.joins(:invoice_items)
    .select('sum(invoice_items.quantity) AS sold_items, items.*')
    .group(:id)
    .order('sold_items DESC')
    .limit(quantity)
  end

  def best_day
#     invoices.select("sum(invoice_items.quantity) as total_quantity, invoices.*")
# .joins(:invoice_items, :transactions)
# .where(transactions: {result: "success"})
# .group("date_trunc('day', invoice_items.created_at), invoices.id")
# .order("total_quantity desc")
# .limit(1)
# .first
# .created_at
  end




end

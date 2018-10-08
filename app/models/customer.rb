class Customer < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .select("merchants.*, count(transactions.id) as count")
    .order("count DESC")
    .first
  end

end

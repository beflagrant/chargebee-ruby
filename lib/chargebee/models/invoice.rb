module ChargeBee
  class Invoice < Model

    class LineItem < Model
      attr_accessor :date_from, :date_to, :unit_amount, :quantity
    end

    class Discount < Model
      attr_accessor :amount, :description
    end

  attr_accessor :id, :subscription_id, :status, :start_date, :end_date, :amount, :paid_on, :next_retry,
  :sub_total, :line_items, :discounts

  # OPERATIONS
  #-----------
    
  def self.list(params={}, env=nil)
    Request.send('get', "/invoices", params, env)
  end    

  def self.retrieve(id, env=nil)
    Request.send('get', "/invoices/#{id.to_s}", env)
  end    

  def self.invoices_for_subscription(id, params={}, env=nil)
    Request.send('get', "/subscriptions/#{id.to_s}/invoices", params, env)
  end    

  end # ~Invoice
end # ~ChargeBee    
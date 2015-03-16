#Garth Fudge
#prints invoices for customers who have "new" status orders

load 'ar.rb'

def currency amount
  sprintf("$%.2f",amount)
end

def to_percentage number
  sprintf("%.2f",number)
end

def print_customer_invoices(customer)
  puts
  puts "Invoices for #{customer.first_name} #{customer.last_name}"
  puts customer.address
  puts "#{customer.city}, #{customer.province.name}"
  
  customer_orders = customer.orders.where(status: 'new')
  customer_orders.each do |order|
    puts
    puts "Order number: #{order.id}"
    puts "Date:  #{order.created_at}"
    puts "Line items:"
    order_subtotal = 0
    order.line_items.each do |order_line_item|
      item_subtotal = 0
      product = order_line_item.product
      if order_line_item.quantity != nil and order_line_item.price != nil      
        item_subtotal = order_line_item.quantity * order_line_item.price
        puts "#{order_line_item.product.name} #{'.'*(50 - product.name.size)} #{order_line_item.quantity} x #{currency(order_line_item.price)} = #{currency(item_subtotal)}"
      elsif order_line_item.quantity != nil and product.price != nil
        item_subtotal = order_line_item.quantity * product.price
        puts "#{order_line_item.product.name} #{'.'*10} #{order_line_item.quantity}x#{currency(product.price)} = #{currency(item_subtotal)}"
      elsif order_line_item.quantity != nil
        puts "Error: Line item #{order_line_item.id}, #{product.name} has nil price"
      elsif product.price != nil
        puts "Error: Line item #{order_line_item.id}, #{product.name} has nil quantity."
      end
      order_subtotal += item_subtotal
    end
    order_pst = 0
    order_gst = 0
    order_hst = 0
    
    order_pst = order_subtotal * order.pst_rate if order.pst_rate > 0
    order_gst = order_subtotal * order.gst_rate if order.gst_rate > 0
    order_hst = order_subtotal * order.hst_rate if order.hst_rate > 0
    
    order_total = order_subtotal + order_pst + order_gst + order_hst
    
    puts
    puts "Sub Total    : #{currency(order_subtotal)}"
    puts "PST (#{to_percentage(order.pst_rate * 100)}%)  : #{currency(order_pst)}" if order.pst_rate > 0
    puts "GST (#{to_percentage(order.gst_rate * 100)}%)  : #{currency(order_gst)}" if order.gst_rate > 0
    puts "HST (#{to_percentage(order.hst_rate * 100)}%)  : #{currency(order_hst)}" if order.hst_rate > 0
    puts "Grand Total  : #{currency(order_total)}"
  end
  puts
end
new_invoice_customers = Customer.includes(:orders).where(orders: {status: 'new'})

new_invoice_customers.each {|customer| print_customer_invoices(customer)}

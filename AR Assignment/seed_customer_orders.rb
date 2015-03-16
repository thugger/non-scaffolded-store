#Garth Fudge, Assignment 2, create orders for 3 customers, orders have 4 line items, output to show created items
load 'ar.rb'

#accepts a customer, returns an order
def create_order(order_customer)
  order = order_customer.orders.build
  order.status = 'new'
  order.pst_rate = order_customer.province.pst
  order.gst_rate = order_customer.province.gst
  order.hst_rate = order_customer.province.hst
  order.save
  return order
end

#accepts an order and product, creates a line item, returns a line_item
def create_line_item(line_item_order, line_item_product)
  line_item = line_item_order.line_items.build
  line_item.product = line_item_product
  line_item.quantity = rand(1..line_item_product.stock_quantity)
  line_item.price = line_item_product.price
  line_item.save
  return line_item
end

#accepts an order, outputs order id and brief description of each line item
def output_order(order)
  puts "Order number: #{order.id}"
    order.line_items.each do |e|
      puts "Line item id: #{e.order.id}-#{e.id} #{e.quantity} x #{e.product.name}....#{e.quantity * e.price} + tax"
    end
end

#find 3 random customers, create orders for each with 4 line items and output each order
3.times do
  #pick customer
  province = Province.all.sample(1)[0]  
  customer = province.customers.all.sample(1)[0]
  #create order
  order = create_order(customer)
  #create 4 line items
  4.times do
    product = Product.all.sample(1)[0]
    create_line_item(order, product)
  end

  #output all orders for this customer
  customer_orders = customer.orders
  
  puts
  puts "#{customer.first_name} #{customer.last_name}"
  
  customer_orders.each do |customer_order|
    output_order(customer_order)
  end
  
  puts
end

#select a customer who has orders
repeat_customer = Order.all.sample(1)[0].customer
#create a new order
new_order = create_order(repeat_customer)
#create line items for order
4.times do
  product = Product.all.sample(1)[0]
  create_line_item(new_order, product)
end
#output
puts "Repeat Customer: #{repeat_customer.first_name} #{repeat_customer.last_name}"
output_order(new_order)
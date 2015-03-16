load 'ar.rb'
#customer = Customer.first
#order = customer.orders.build
#
#order.status = 'new'
#order.pst_rate = customer.province.pst
#order.gst_rate = customer.province.gst
#order.hst_rate = customer.province.hst
#order.save
#product1 = Product.first
#line_item1 = order.line_items.build
#line_item1.product = product1
#line_item1.quantity = 12
#line_item1.price = product1.price
#line_item1.save
#puts order.inspect
#
#customer_orders = customer.orders
#
#puts customer_orders.inspect

customer = Customer.all.sample(1)[0]
#
Order.limit(5).each {|order| puts order.created_at }

#product = Product.all.sample(1)
#puts product[0].inspect
#puts rand(1..product[0].stock_quantity)
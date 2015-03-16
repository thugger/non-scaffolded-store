    #
    #In the challenge_update.rb file:
    #    Find all products with a stock quantity greater than 40.
    #    Add one to the stock quantity of each of these products and then save these changes to the database.
load 'ar.rb'

forty_plus_stock_products = Product.where("stock_quantity > 40")

forty_plus_stock_products.each {|p| puts "pre: #{p.name} #{p.stock_quantity}"}
forty_plus_stock_products.each {|p| p.stock_quantity +=1}
forty_plus_stock_products.each {|p| puts "post: #{p.name} #{p.stock_quantity}"}
forty_plus_stock_products.each {|p| p.save }
check = Product.where("stock_quantity > 40")
check.each {|p| puts "check: #{p.name} #{p.stock_quantity}"}

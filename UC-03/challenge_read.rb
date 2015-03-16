    #
    #In the challenge_read.rb file:
    #    Use the Product class to find (any) product from the database.
    #    Inspect the Product object you have retrieved. 
    #        In a comment within your product.rb file, record all the columns that exist in the products table. 
    #    Based on the columns you find, can you determine if the products table has an association with any other tables? If so, what table?
    #    Use ActiveRecord to find and print out:
    #        Total number of products
    #        The names of all products above $10 with names that begin with the letter C.
    #        Total number of products with a low stock quantity. (Low is defined as less than 5 in stock.)


load 'ar.rb'
#retrieve first product from db
newProduct = Product.first
#inspect first product
puts newProduct.inspect
#list columns for Products, identify likely foreign key
#Product columns: Product id, name, description, price, stock_quantity, category_id, created_at, updated_at
#category_id references the primary key of the category class, identified by ruby ar standards of including _id in name of non-primary key for current table

#total number of products: 77
puts "There are #{Product.count} products."
#retrieve list of products under $10 with name starting with C:
#Chai, Chang, Chef Anton's Cajun Seasoning, Chef Anton's Gumbo Mix, Carnarvon Tigers, Côte de Blaye, Chartreuse verte, Chocolade, Camembert Pierrot

tendollarCnameProducts = Product.where("price > 10 AND name LIKE 'C%'")

tendollarCnameProducts.each {|p| puts p.name}
#8 products with > 5 stock_quantity
puts Product.where("stock_quantity < 5").count


Category.all.each {|c| puts "#{c.description} #{c.id}"}

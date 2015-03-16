load 'ar.rb'
        #
    #In the challenge_create.rb file:
    #    Create three new products using the three different ways to create new AR objects.
    #    Ensure that all three new products are persisted to the database, without validations errors.
    #    Create a Product object that is missing some required columns.
    #    Attempt to save this product and print all the AR errors which are generated.


product_the_first = Product.new(         id:  300,
                                       name: "Dragon fruit",
                                description: "Spikey fruit, tastes better fresh",
                                      price: 5.00,
                             stock_quantity: 15,
                                category_id: 7 )
puts product_the_first.inspect

product_the_second = Product.create(         id:  301,
                                           name: "Fish Heads",
                                    description: "Apparently the eyeballs are the best",
                                          price: 15.00,
                                 stock_quantity: 7000,
                                    category_id: 8 )

puts product_the_second.inspect

product_the_third = Product.new()
product_the_third.id = 302
product_the_third.name = "Stinky Cheese"
product_the_third.description = "Not just smelly, stinky!"
product_the_third.price = 70.99
product_the_third.stock_quantity = 1
product_the_third.category_id = 4

puts product_the_third.inspect

product_the_broken = Product.create(   price: 5.00,
                              stock_quantity: 1500,
                                 category_id: 2 )

puts product_the_broken.inspect #this should error... but it doesn't appear to do anything

puts "Product 1 saved" if product_the_first.save
puts "Product 2 saved" if product_the_second.save #save fails because create loaded the object into the db
puts "Product 3 saved" if product_the_third.save
product_the_broken.save #fails


product_the_first.errors.messages.each do |c, e|
                                       e.each {|err| puts "#{c} #{err}"}
                                       end


product_the_second.errors.messages.each do |c, e|
                                       e.each {|err| puts "#{c} #{err}"}
                                       end

product_the_third.errors.messages.each do |c, e|
                                       e.each {|err| puts "#{c} #{err}"}
                                       end

product_the_broken.errors.messages.each do |c, e|
                                       e.each {|err| puts "#{c} #{err}"}
                                       end
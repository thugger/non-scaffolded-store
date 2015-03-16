    #
    #In the challenge_delete.rb file:
    #    Find one of the products you created in challenge_create.rb and delete it from the database.
load 'ar.rb'
product_to_nuke1 = Product.where(:id => 300).first
product_to_nuke2 = Product.find(301)
product_to_nuke3 = Product.find(302)
puts product_to_nuke1.inspect
puts product_to_nuke2.inspect

product_to_nuke1.destroy
product_to_nuke2.destroy
product_to_nuke3.destroy
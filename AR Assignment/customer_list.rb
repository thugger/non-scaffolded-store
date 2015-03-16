# The ar.rb file loads all of our ActiveRecord Object and
# establishes our database connection.
load 'ar.rb'

# Load up ten customers and display their details.
customers = Customer.limit(20)

# Loop through these customers displaying their names, email
# addresses, mailing address and city.
customers.each do |customer|
  puts "ID: #{customer.id}"
  puts "Name: #{customer.first_name} #{customer.last_name}"
  puts "Email: #{customer.email}"
  puts "Address: #{customer.address}, #{customer.city}"
  #puts customer.inspect
  puts
end


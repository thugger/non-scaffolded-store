#Garth Fudge,
#pulls first name for each customer, splits on a " ", sets customer's first name and last name

load 'ar.rb'

customer_names = Customer.select(:id, :first_name)

fixedcustomers = []
customer_names.each do |customer|
  fixedcustomers << { id: customer.id,
                      full_name: customer.first_name,
                      first_name: customer.first_name.split(" ")[0],
                      last_name: customer.first_name.split(" ")[1]}
end

fixedcustomers.each do |customer|
  database_customer_entry = Customer.find(customer[:id])
  if (database_customer_entry.first_name = customer[:full_name])
    database_customer_entry.first_name = customer[:first_name]
    database_customer_entry.last_name = customer[:last_name]
    if database_customer_entry.save
      puts "#{customer[:id]} was updated."
    else
      puts "#{customer[:id]} was not updated"
    end
  else
    puts "#{customer[:id]} did not need to be updated"
  
  end
  
  
end



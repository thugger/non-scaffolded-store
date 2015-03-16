class Product < ActiveRecord::Base
  #Product columns: Product id, name, description, price, stock_quantity, category_id, created_at, updated_at
  validates :name, :description, :price, :stock_quantity, presence: true
  validates :name, uniqueness: true
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category
end

    #
    #Modify the Product model class:
    #    Add a validation to this class such that a product must have all columns (other than foreign keys, the id, or datetime column) filled out before it can be saved to the db.
    #    Research AR validations and add a validation that will ensure that all product names are unique.

class Bottle
  include MongoMapper::Document
    
  key :company_id, ObjectId, :required => true
  key :name, String, :required => true
  key :color, String
  key :price, Integer
 
  key :have_ids, Array
  many :haves, :class_name => 'User', :in => :have_ids

  belongs_to :company

end

class Bottle
  include MongoMapper::Document

  key :brand, String
  key :color, String
  key :price, Integer

  belongs_to :user

end

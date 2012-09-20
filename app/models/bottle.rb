class Bottle
  include MongoMapper::Document

  key :brand, String
  key :name, String
  key :color, String
  key :price, Integer

end

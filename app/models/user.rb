class User
  include MongoMapper::Document

  key :first_name, String
  key :last_name, String
  key :owned_bottles, Array

  many :bottles, :in => :owned_bottles

end

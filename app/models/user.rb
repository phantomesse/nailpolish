class User
  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String
  key :email, String
    
  many :bottles

end

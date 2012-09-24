class Company
  include MongoMapper::Document

  key :name, String, :required => true

  many :bottles

end

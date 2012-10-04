class User
  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String
  key :email, String, :required => true
  
  many :bottles
  
  def name
    return "#{first_name} #{last_name}"
  end
  
  before_save :downcase_fields
  
  def downcase_fields
    email.downcase!
  end
  
end

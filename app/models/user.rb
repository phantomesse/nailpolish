class User
  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String, :required => true
  key :email, String, :required => true
  key :bottle_ids, Array
  
  validates :first_name, :format => { :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters" }
  validates :last_name, :format => { :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters" }
  validates :email, :uniqueness => true
  
  many :bottles, :in => :bottle_ids
  
  def name
    return "#{first_name} #{last_name}"
  end
  
  before_save :downcase_fields
  
  def downcase_fields
    email.downcase!
  end
    
end

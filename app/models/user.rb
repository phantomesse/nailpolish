class User
  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String, :required => true
  key :email, String, :required => true
  
  many :selections
  
  validates :first_name, :format => { :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters" }
  validates :last_name, :format => { :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters" }
  validates :email, :uniqueness => true
    
  def name
    return "#{first_name} #{last_name}"
  end
  
  before_save :downcase_fields
  before_create :create_default_selections
  before_destroy :delete_all_selections
  
  def downcase_fields
    email.downcase!
  end
  
  def create_default_selections
    return self.selections.create(:name => "Owned Nail Polishes")
  end
  
  def delete_all_selections
    self.selections.delete_all
  end
  
end

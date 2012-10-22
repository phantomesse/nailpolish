class User
  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String, :required => true
  key :email, String, :required => true
  key :owned_bottle_ids, Array
  key :wanted_bottle_ids, Array
  
  many :selections
  
  validates :first_name, :format => { :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters" }
  validates :last_name, :format => { :with => /\A[a-zA-Z]+\z/, :message => "can only contain letters" }
  validates :email, :uniqueness => true
    
  def name
    return "#{first_name} #{last_name}"
  end
  
  before_save :downcase_fields
  
  def downcase_fields
    email.downcase!
  end
  
  def own_bottle(bottle)
    if owned_bottle_ids.index(bottle.id).nil?
      owned_bottle_ids << bottle.id
      save!
    end
  end
  
  def disown_bottle(bottle)
    if owned_bottle_ids.index(bottle.id)
      owned_bottle_ids.delete(bottle.id)
      save!
    end
  end
  
  def want_bottle(bottle)
    if wanted_bottle_ids.index(bottle.id).nil?
      wanted_bottle_ids << bottle.id
      save!
    end
  end
  
  def unwant_bottle(bottle)
    if wanted_bottle_ids.index(bottle.id)
      wanted_bottle_ids.delete(bottle.id)
      save!
    end
  end
  
end

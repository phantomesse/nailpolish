class User
  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String
  
  def bottles
    Bottle.where(:have_ids => id).all
  end
  
  def add_bottle(bottle)
    bottle.haves << self
    bottle.save!
  end
  
  many :bottles

end

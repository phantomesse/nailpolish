class Selection
  include MongoMapper::Document

  key :name, String, :required => true
  key :bottle_ids, Array
  key :user_id, ObjectId
  key :public_url, String
  
  belongs_to :user
  before_save :set_public_url
  
  def set_public_url
    selection_name = name
    user_name = User.find(user_id).name
    return self.public_url = "#{user_name.gsub(" ", "")}/#{selection_name.gsub(" ", "-")}".downcase
  end
  
  def add_bottle(bottle)
    if bottle_ids.index(bottle.id).nil?
      bottle_ids << bottle.id
      save!
    end
  end
  
  def remove_bottle(bottle)
    if bottle_ids.index(bottle.id)
      bottle_ids.delete(bottle.id)
      save!
    end
  end

end

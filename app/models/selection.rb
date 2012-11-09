class Selection
  include MongoMapper::Document

  key :name, String, :required => true
  key :bottle_ids, Array
  key :user_id, ObjectId
  
  belongs_to :user
  
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

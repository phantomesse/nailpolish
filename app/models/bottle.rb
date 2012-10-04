class Bottle
  include MongoMapper::Document
    
  key :company_id, ObjectId, :required => true
  key :name, String, :required => true
  key :color, String
  key :price, Integer
  
  belongs_to :company
    
  def price_string
    price_string = price.to_s
    dollar = price_string[0,price_string.length-2]
    cents = price_string[price_string.length-2, price_string.length]
    if dollar.length == 0
      dollar = "0"
    end
    price_string = "$#{dollar}.#{cents}"
    return price_string
  end
  
  def image_path
    return "#{simplify_string(company.name)}_#{simplify_string(name)}.png".downcase
  end
  
  def simplify_string(string)
    string = string.gsub("'", "")
    string = string.gsub(" ", "_")
    return string
  end

end

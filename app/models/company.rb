class Company
  include MongoMapper::Document

  key :name, String, :required => true

  many :bottles
  
  def image_path
    return "companies/#{simplify_string(name)}.png".downcase
  end
  
  def simplify_string(string)
    string = string.gsub("'", "")
    string = string.gsub(" ", "_")
    return string
  end

end

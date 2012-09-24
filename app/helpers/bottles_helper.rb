module BottlesHelper
 def get_price(price)
  price_string = price.to_s
  dollar = price_string[0,price_string.length-2]
  cents = price_string[price_string.length-2, price_string.length]
  if dollar.length == 0
    dollar = "0"
  end
  price_string = "$".concat(dollar).concat(".").concat(cents)
  return price_string
 end

 def get_image_path(bottle)
  image_path = (simplify_string(bottle.company.name)).concat("_").concat(simplify_string(bottle.name)).concat(".png")
  image_path = image_path.downcase
  return image_path
 end

 def simplify_string(string)
  string = string.gsub("'", "")
  string = string.gsub(" ", "_")
  return string
 end
end

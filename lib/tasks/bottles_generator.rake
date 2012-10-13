namespace :bottles do
  desc "Cleans the bottles database and re-inserts all bottles into the database."
  task :generate_bottles => :environment do
    Bottle.delete_all
    
    Dir.foreach("app/assets/images/bottles/.") do |file|
      if File.extname(file) == ".png"
        file = File.basename(file, ".png");

        my_name = nil
        my_company = nil
        
        Company.each do |company|
          company_name = company.name.downcase.gsub(" ", "_")
          if file.start_with? company_name 
            my_company = company
            my_name = file[company_name.length+1..file.length]
            break
          end
        end

        old_name = my_name
        my_name = ""
        old_name.split("_").each do |word|
          my_name +=  word.camelize + " "
        end
        my_name = my_name[0..my_name.length-2]

        add_to_database(my_name, my_company)
      end
    end
  end
end

def add_to_database(my_name, my_company)
  my_price = nil
  my_color = "Neutral"
  if my_company.name == "Essie"
    my_price = 800
  elsif my_company.name == "OPI"
    my_price = 699
  elsif my_company.name == "Wet n Wild"
    my_price = 99
  elsif my_company.name == "Kleancolor"
    my_price = 299
  elsif my_company.name == "Butter London"
    my_price = 1400
  end

  puts "Name: #{my_name}"
  puts "Company: #{my_company.name}"
  puts "Price: #{my_price}"

  bottle = Bottle.create(:name => my_name, :company => my_company, :price => my_price, :color => my_color)
  bottle.save!
end

module BottlesHelper
  def nailpolish_colors
    return ["Neutral", "Pink", "Red", "Purple", "Blue/Green", "Orange/Yellow", "Brown", "Effects", "Top/Base"]
  end
  
  def link_to_own(user, bottle)
    selection = user.selections.first(:name => "Owned Nail Polishes")
    if selection.bottle_ids.index(bottle.id).nil?
      link_to("own", {:controller => 'selections', :action => 'add_bottle', :selection => selection, :bottle => bottle}, :id => "actions-own", :class => "btn")
    else
      link_to("disown", {:controller => 'selections', :action => 'remove_bottle', :selection => selection, :bottle => bottle}, :id => "actions-own", :class => "btn")
    end
  end
  
  def bottle_img(bottle)
    if Rails.application.assets.find_asset bottle.image_path
      "<img src=\"#{asset_path(bottle.image_path)}\" />"
    else
      "<img src=\"#{asset_path("bottles/error_bottle.png")}\" />"
    end
  end
end

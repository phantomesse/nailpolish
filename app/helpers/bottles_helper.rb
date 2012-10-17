module BottlesHelper
  def nailpolish_colors
    return ["Neutral", "Pink", "Red", "Purple", "Blue/Green", "Orange/Yellow", "Brown", "Effects", "Top/Base"]
  end
  
  def link_to_want(user, bottle)
    want = user.wanted_bottle_ids.index(bottle.id) == nil ? "want" : "unwant"
    if user.owned_bottle_ids.index(bottle.id)
      # Cannot want a bottle that you own
      link_to("you own this", bottle, :id => "actions-want", :class => "btn disabled", :onClick => "return false")
    else
      link_to(want, {:controller => 'users', :action => 'bottle_action', :user => user, :bottle => bottle, :bottle_action =>  want}, :id => "actions-want", :class => "btn")
    end
  end
end

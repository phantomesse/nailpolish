module ApplicationHelper
  def menu_link_to(text, controller, action)
    active = 'active' if params[:controller] == controller and params[:action] == action
    "<li class='#{active}'>" + link_to(text, :controller => controller, :action => action) + "</li>"
  end
end

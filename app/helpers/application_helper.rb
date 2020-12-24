module ApplicationHelper
  include Orchid::ApplicationHelper

  def about_nav_class(nav_item)
    if params["action"] == nav_item
      "btn btn-filter btn-primary"
    else
      "btn btn-filter btn-warning"
    end
  end

  # need facet_selected? for footage page
  # and it's otherwise only available to items controller
  def facet_selected?(type, facet="")
    if params["f"].present?
      if facet && facet.length > 0
        params["f"].include?("#{type}|#{facet}")
      else
        params["f"].any? { |f| f.include?(type) }
      end
    else
      false
    end
  end

  def topic_selected?(facet)
    params["topic"] == facet
  end

end

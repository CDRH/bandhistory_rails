module ApplicationHelper
  include Orchid::ApplicationHelper

  # need facet_selected? for footage page
  # and it's otherwise only available to items controller
  def facet_selected? type, facet=""
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
end

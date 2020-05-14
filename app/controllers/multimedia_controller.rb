class MultimediaController < ApplicationController

  def image
    @res = $api.get_item_by_id(params["id"]).first
  end

  def images
    @title = "Images"

    options = params.permit!.deep_dup
    options["f"] = [] if options["f"].blank?
    options["f"] << "subcategory|Images"
    if params["topic"].present?
      options["f"] << "topics|#{params["topic"]}"
    end

    @facets = $api.query({
      "facet" => "topics",
      "facet_sort" => "term|asc",
      "num" => 0,
      "f" => ["subcategory|Images"]
    })
    @res = $api.query(options)
    @route_path = "images_path"
    render_overridable "items", "search_preset"
  end

end

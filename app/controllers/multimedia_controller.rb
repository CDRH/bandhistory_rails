class MultimediaController < ApplicationController

  def footage
    options = params.permit!.deep_dup
    options["f"] = [] if options["f"].blank?
    options["f"] << "subcategory|Footage"

    @facets = $api.query({
      "facet" => "keywords",
      "facet_sort" => "term|asc",
      "num" => 0,
      "f" => ["subcategory|Footage"]
    })

    @res = $api.query(options)
    @route_path = "footage_path"
    # essentially using search_preset but with my own view
  end

  def footage_clip
    item_retrieve(params["id"])
  end

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

  private

  # copied directly from items_controller.rb
  # modified only to use $api instead of section specific
  # and to use footage title
  def item_retrieve(id)
    @res = $api.get_item_by_id(id).first
    if @res
      url = @res["uri_html"]
      @html = Net::HTTP.get(URI.parse(url)) if url
      @title = @res["title"]

      render_overridable("items", "show")
    else
      @title = t "item.no_item", id: id,
        default: "No item with identifier #{id} found!"
      render_overridable("items", "show_not_found", status: 404)
    end
  end

end

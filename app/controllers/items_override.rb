ItemsController.class_eval do

  def multimedia_footage
    options = params.permit!.deep_dup
    options["f"] = [] if options["f"].blank?
    options["f"] << "category2|Footage"

    @facets = $api.query({
      "facet" => "keywords",
      "facet_sort" => "term|asc",
      "num" => 0,
      "f" => ["category2|Footage"]
    })

    @res = $api.query(options)
    @route_path = "footage_path"
    # essentially using search_preset but with my own view
  end

  def multimedia_footage_clip
    item_retrieve(params["id"])
  end

  def multimedia_image
    @res = $api.get_item_by_id(params["id"]).first
  end

  def multimedia_images
    options = params.permit!.deep_dup
    options["f"] = [] if options["f"].blank?
    options["f"] << "category2|Images"
    if params["topic"].present?
      options["f"] << "topics|#{params["topic"]}"
      @title = "#{params["topic"].titleize} Images"
    else
      @title = "Images"
    end

    @facets = $api.query({
      "facet" => "topics",
      "facet_sort" => "term|asc",
      "num" => 0,
      "f" => ["category2|Images"]
    })
    @res = $api.query(options)
    @route_path = "images_path"
    render_overridable "items", "search_preset"
  end

end

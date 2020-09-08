module ItemsHelper
  include Orchid::ItemsHelper


  # because of how the link is being structured, this method needs to return only
  # the path and NOT an entire link, differing from the orchid expected behavior
  def search_item_link(item)
    subcategory = item["subcategory"].downcase

    if subcategory == "audio"
      id = item["identifier"].split(".").last
      path = audio_item_path(id: id)
    elsif subcategory == "images"
      path = image_path(id: item["identifier"])
    elsif subcategory == "footage"
      path = footage_clip_path(id: item["identifier"])
    elsif subcategory == "personal accounts"
      id = item["identifier"].split(".").last
      path = account_path(id: id)
    elsif subcategory == "features"
      id = item["identifier"].split(".").last
      path = feature_path(id: id)
    end

    path
  end

  def title_label(item)
    # if locale is english specifically, use title
    # otherwise always use title_es_k
    untitled = t("search.results.item.no_title", default: "Untitled")
    if locale == :en
      item["title"].present? ? item["title"] : untitled
    else
      item["title_es_k"].present? ? item["title_es_k"] : untitled
    end
  end

end

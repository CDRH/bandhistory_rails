module ItemsHelper
  include Orchid::ItemsHelper

  def search_item_link(item)
    subcategory = item["subcategory"].downcase
    title_display = item["title"].present? ?
      item["title"] : t("search.results.item.no_title", default: "Untitled")

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

    link_to title_display, path
  end

end

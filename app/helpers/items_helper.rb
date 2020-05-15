module ItemsHelper
  include Orchid::ItemsHelper

  def search_item_link(item)
    subcategory = item["subcategory"].downcase
    title_display = item["title"].present? ?
      item["title"] : t("search.results.item.no_title", default: "Untitled")

    if subcategory == "images"
      path = image_path(id: item["identifier"])
    elsif subcategory == "footage"
      path = footage_clip_path(id: item["identifier"])
    end

    puts "PATH #{path}"
    link_to title_display, path
  end

end

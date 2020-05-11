Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # general
  get "timeline", to: "general#timeline", as: "timeline"

  # multimedia
  get "multimedia", to: "multimedia#index", as: "multimedia"
  get "multimedia/audio", to: "multimedia#audio", as: "audio"
  get "multimedia/audio/:id", to: "multimedia#audio_item", as: "audio_item"
  get "multimedia/documents", to: "multimedia#documents", as: "documents"

  # stories
  get "stories", to: "stories#index", as: "stories"
  get "stories/accounts", to: "stories#accounts", as: "accounts"
  get "stories/accounts/:id", to: "stories#account", as: "account"
  get "stories/features", to: "stories#features", as: "features"
  get "stories/features/:id", to: "stories#feature", as: "feature"
end

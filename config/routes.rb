Rails.application.routes.draw do
  with_period = /[^\/]+/
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # general
  get "timeline", to: "general#timeline", as: "timeline"

  # multimedia
  get "multimedia", to: "items#multimedia", as: "multimedia"
  get "multimedia/audio", to: "items#multimedia_audio", as: "audio"
  get "multimedia/audio/:id", to: "items#multimedia_audio_item", as: "audio_item"
  get "multimedia/documents", to: "items#multimedia_documents", as: "documents"
  get "multimedia/images", to: "items#multimedia_images", as: "images"
  # note: topic has same path as ID so need constraint on matches
  get "multimedia/images/:topic", to: "items#multimedia_images", as: "image_topic",
    topic: /(aerial|field|group|parade|people)/
  get "multimedia/images/:id", to: "items#multimedia_image",
    as: "image", id: with_period
  get "multimedia/footage", to: "items#multimedia_footage", as: "footage"
  get "multimedia/footage/:id", to: "items#multimedia_footage_clip",
    as: "footage_clip", id: with_period

  # stories
  get "stories", to: "stories#index", as: "stories"
  get "stories/accounts", to: "stories#accounts", as: "accounts"
  get "stories/accounts/:id", to: "stories#account", as: "account"
  get "stories/features", to: "stories#features", as: "features"
  get "stories/features/:id", to: "stories#feature", as: "feature"
end

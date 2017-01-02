Rails.application.routes.draw do
  resources :posts
  root "posts#index"
  get "tag/:name" => "tags#filter", as: :tag_filter
  get "api/cloud" => "tags#cloud", defaults: { format: 'json' }
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :articles

  get "articles" => "articles#index"
  get "articles/new" => "articles#new", as: "newarticle"
  post "articles/new" => "articles#create"
  get "articles/:id" => "articles#show"
  get "articles/:id/edit" => "articles#edit", as: "editArticle"
  put "articles/:id/edit" => "articles#update"
  post "articles/makecomment" => "makecomment"

  get "events" => "events#index"
  get "events/new" => "events#new", as: "newevent"
  post "events/new" => "events#create"
  get "events/:id" => "events#show"
  get "events/:id/edit" => "events#edit", as: "editEvent"
  put "events/:id/edit" => "events#update"
  post "events/makecomment" => "makecomment"
  root to: 'articles#index'
end

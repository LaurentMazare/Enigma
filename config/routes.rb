Teaser::Application.routes.draw do
  resources :enigmas

  root :to => "enigmas#index"
  match "/tags/:tag_id" => "enigmas#index"
  match "/login" => "home#login"
  match "/logout" => "home#logout"
end

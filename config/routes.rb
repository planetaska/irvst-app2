Rails.application.routes.draw do
  resources :articles
  root "static#home"

  # static pages
  inertia 'about' => 'About'
end

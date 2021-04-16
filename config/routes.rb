Rails.application.routes.draw do
  resources :widgets, only: [:show, :index]
  resources :widget_ratings, only: [:create]

  if Rails.env.development?
    resources :design_system_docs, only: [:index]
  end

  # Custom routes start here
  #
  # For each custom route:
  # * Be sure you have the cannonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # Used in podcast ads for the 'amazing' campaign
  get '/amazing', to: redirect('/widgets')
end

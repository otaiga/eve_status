Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'generals#index'

  # Example resource route within a namespace:
    namespace :api do
      get 'server_stats', to: 'misc_apis#server_stats'
      get 'skill_tree', to: 'general_apis#skill_tree'
    end
end

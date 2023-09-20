Rails.application.routes.draw do
  resources :tasks do
    member do
      put 'toggle_completion'
    end
  end
  root 'tasks#index'
end

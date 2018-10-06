Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get 'most_items', to: 'most_items#index'
        get 'most_revenue', to: 'most_revenue#index'
        get '/:id/items', to: 'items#show'
        get '/:id/invoices', to: 'invoices#show'

      end
      namespace :items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      namespace :transactions do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      namespace :customers do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      namespace :invoice_items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end
      scope module: :merchants do
        resources :merchants, only:[:index, :show]
      end
      resources :items, only:[:index, :show]
      resources :customers, only:[:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end

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
        get '/:id/invoice_items', to: 'invoice_items#show'
        get '/:id/merchant', to: 'merchants#show'

      end
      namespace :transactions do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/invoice', to: 'invoices#show'
      end
      namespace :customers do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/transactions', to: 'transactions#show'
        get '/:id/invoices', to: 'invoices#show'
      end
      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/transactions', to: 'transactions#show'
        get '/:id/merchant', to: 'merchants#show'
        get '/:id/items', to: 'items#show'
        get '/:id/invoice_items', to: 'invoice_items#show'
        get '/:id/customer', to: 'customers#show'
      end
      namespace :invoice_items do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/invoice', to: 'invoices#show'
        get '/:id/item', to: 'items#show'
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

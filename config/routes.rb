# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :products

get "products/sort(/:order/:option)", to: "products#index", as: :products_sort
#get "products", to: "products#index", as: :products_index



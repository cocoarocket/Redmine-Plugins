# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get "products",             to: "products#index"
get "products/sort/:order", to: "products#index", as: :products_sort

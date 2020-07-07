# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resource :product

get "products/sort/:order", to: "products#index", as: :products_sort
get "products", to: "products#index"



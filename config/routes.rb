Rails.application.routes.draw do
  devise_for :users

root to: "homes#top"

get '/users', to: 'users#index'

get "/home/about" => "homes#about", as: "about"



resources :books, only: [:create, :index, :show, :update, :edit, :destroy]

resources :users, only: [:index, :show, :edit, :update]
end









#   Rails.application.routes.draw do
#     # ユーザ関連ルーティング
#     resources :users

#     # 投稿関連ルーティング
#     resources :books


# get 'users/index'
# get 'users/show'
# get 'users/edit'

# get 'books/new'
# get 'books/index'
# get 'books/show'
# get 'books/edit'
# get 'books/top'

# get 'top', to: 'homes#top'

# resources :books do
#   member do
#     patch '', action: :update, as: 'update'
#     delete '', action: :destroy, as: 'destroy'
#   end
# end






# root 'books#index'

# resources :users, only: [:index, :show, :edit]
# resources :books, except: [:new]

# get 'books/top', to: 'books#top'
# root 'books#index'
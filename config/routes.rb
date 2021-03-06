Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get "/search" => "searchs#search"

  resources :users, only:[:index,:show,:edit,:update] do
     resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only:[:index, :create, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :groups do
    get "join" => "groups#join"
  end


  resources :chats, only: [:show, :create]

end

Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/create'
  # get 'comments/edit'
  # get 'comments/update'
  # get 'comments/destroy'
  # get 'likes/create'
  # get 'likes/destroy'
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/show'
  # get 'posts/edit'
  # get 'posts/update'
  resources :posts do
    resources :likes, only:[:create, :destroy]
    resources :comments, except:[:new, :show]
  end 
  root "posts#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end

Rails.application.routes.draw do

  get 'user_dashboards' =>  'users#index'
  get 'edit_profile' =>  'users#profile'

  #get 'show_user' =>  'users#show_user'

  put 'users/:id' =>  'users#update'
  patch 'users/:id' =>  'users#update'


  get 'show_user/:id' => 'users#show', as: :show_user

  get 'followers/:id' => 'users#followers'
  get 'following/:id' => 'users#following'

  get 'remove_avatar/:id' => 'users#remove_avatar'

  resources :posts
  devise_for :admins
  devise_for :users
  #get 'home/index'

  resources :users do
    member do
      get :following, :followers
    end
    resources :questions
  end
  resources :relationships,       only: [:create, :destroy]
  root to: 'home#index'


  get 'questions' => "questions#index"
 # resources :questions


  resources :questions do
    resources :answers
  end
  resources :answers


  put "like_question" => "questions#upvote"
  put "dislike_question" => "questions#downvote"


  put "like_answer" => "answers#upvote"
  put "dislike_answer" => "answers#downvote"

  # resources :answers do
  #   resources :answers
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

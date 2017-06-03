Rails.application.routes.draw do

  get 'user_dashboards' =>  'user_dashboards#index'
  get 'edit_profile' =>  'user_dashboards#profile'

  resources :posts
  devise_for :admins
  devise_for :users
  #get 'home/index'

  resources :users do
    member do
      get :following, :followers
    end
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

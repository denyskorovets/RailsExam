Rails.application.routes.draw do
  post 'sessions/create' => 'sessions#create'

  get 'bright_ideas' => 'posts#index'

  get 'bright_ideas/:id' => 'posts#show'

  get 'sessions/index'

  get 'sessions/destroy'

  get 'likes/like'

  post 'likes' => 'likes#like'

  get 'posts/show'

  get 'users/:id' => 'users#show'

  post 'posts/create' => 'posts#create'

  post 'users/create' => 'users#create'

  delete 'posts/:id' => 'posts#destroy'

  root to: 'sessions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

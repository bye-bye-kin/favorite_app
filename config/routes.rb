Rails.application.routes.draw do
  root to: 'home#top'
  #homeコントローラーのtopアクションが、トップページとして呼び出される。
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :user, except: [:new, :create, :destroy]
  #expect...new,create,destroy以外のルーティングを作成するということ。
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end
end

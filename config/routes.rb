Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
  root to: 'home#top'
  #homeコントローラーのtopアクションが、トップページとして呼び出される。
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :user, except: [:new, :create, :destroy]
  #expect...new,create,destroy以外のルーティングを作成するということ。
end

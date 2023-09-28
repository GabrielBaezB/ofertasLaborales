Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :job_offers

  devise_scope :user do
    get 'create_user', to: 'registrations#new'
    post 'create_user', to: 'registrations#create'
  end

  root "job_offers#index"
end

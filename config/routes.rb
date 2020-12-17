Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backoffice', as: 'rails_admin'

  authenticate :user, ->(u) { u.is_admin? || u.is_employee? } do
    # These are things users shouldn't even know exist if they aren't an admin
    resources :interventions
    resources :addresses, only: %i[index]
    get 'interventions', to: 'interventions#interventions'
    get 'buildings', to: 'interventions#buildings'
    get 'batteries', to: 'interventions#batteries'
    get 'columns', to: 'interventions#columns'
    get 'elevators', to: 'interventions#elevators'
    get 'speech', to: 'azure_speech#index'
    get 'verify_audio', to: 'azure_speech#verify_audio'
    post 'upload_audio', to: 'azure_speech#upload_audio'
    get 'create_profile_id', to: 'azure_speech#create_profile_id'
    post 'enroll_profile', to: 'azure_speech#upload_audio'
  end

  resources :leads

  resources :quotes, only: %i[user_quotes new create]

  root to: 'static_pages#index'
  get 'static_pages/residential'
  get 'static_pages/corporate'

  devise_for :users,
             controllers: {
               registrations: 'users/registrations', sessions: 'users/sessions'
             },
             path_names: {
               sign_in: 'sign_in',
               sign_out: 'sign_out',
               password: 's',
               confirmation: 'v'
             }

  get 'my_quotes' => 'quotes#user_quotes', as: :my_quotes
  get 'my_leads' => 'leads#user_leads', as: :my_leads

  resource :messages do
    collection { post 'reply' }
  end
end

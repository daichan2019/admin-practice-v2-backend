Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      namespace 'auth' do
        resources :users, only: %i[create show]
        namespace :me do
          resource :account, only: %i[update]
        end
      end

      resources :microposts, only: %i[index create show update destroy]
    end
  end
end

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :microposts, only: %i[index create show update destroy]
      namespace 'auth' do
        resources :users, only: %i[create show]
      end
    end
  end
end

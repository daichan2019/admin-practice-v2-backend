Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :microposts, only: %i[index create show update destroy]
      namespace 'auth' do
        post 'users' => 'users#create'
      end
    end
  end
end

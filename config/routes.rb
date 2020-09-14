Rails.application.routes.draw do
  resources :tclones do
    collection do
      post :confirm
    end
  end
end

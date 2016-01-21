Rails.application.routes.draw do
  resources :document_types, param: :code, only: [:index, :show]
end

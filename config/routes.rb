Rails.application.routes.draw do
  resources :academic_units, param: :code, only: [:index, :show]
  resources :document_types, param: :code, only: [:index, :show]
end

Rails.application.routes.draw do
  get 'calendario/:ano/:mes', to: 'calendario#show', as: 'calendario_mes'
  get 'calendario', to: 'calendario#index', as: 'calendario_index'
  root "calendario#mes_atual"
end

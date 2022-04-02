Rails.application.routes.draw do
  get 'perfil', to: "users#edit"
  resources :categories

  devise_for :users
  #get 'home/index'

  root to: 'home#index'

  resources :users, only: [:update]


  #get "notebooks", to: "notebooks#index"

 #get "notebooks/user/:user_id", to: 'notebooks#from_owner'

 resources :tasks do
  get "user/:user_id", to: "tasks#from_owner", on: :collection, as: :my_tasks
 end

 #es un objeto que podemos CRUD
 resources :notebooks do
  #ruta de coleccione para conjunto de objetos y member para un objeto en espesifico
  get "user/:user_id", to: "notebooks#from_owner", on: :collection, as: :my_notebooks
  
 end


  #get 'notebooks/new', to: 'notebooks#new', as: :new_notebook
  #GET consultar mediante el id retorna un registro
  #get 'notebooks/:id', to: 'notebooks#show', as: :show_notebook
  #GET consultar mediante id retorna registro vista 
  #get 'notebooks/:id/edit', to: 'notebooks#edit', as: :edit_notebook
  #PATCH actualizacion mediante lo suministrado en edit
  #patch '/notebooks/:id', to: 'notebooks#update', as: :notebook
  #PUT#POST Crear registro guarda de forma segura
  #post 'notebooks', to: 'notebooks#create'
  #DELETE eliminar recursos del back
  #delete '/notebooks/:id', to: 'notebooks#destroy'


  
   
  #put '/notebooks/:id', to: 'notebooks#update', as :notebook
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


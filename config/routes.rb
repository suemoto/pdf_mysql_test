Rails.application.routes.draw do
  devise_for :users
  root to: 'myfiles#index'
  get 'myfiles/downloadpdf/:id'=> 'myfiles#downloadpdf' ,as: :donwload_pdf
  
  resources :myfiles do
    collection do 
      get :search
      get :tag
    end
  end
    # get 'myfiles/downloadpdf/download'=> 'myfiles#downloadpdf'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

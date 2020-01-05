Rails.application.routes.draw do
  get 'myfiles/downloadpdf/:id'=> 'myfiles#downloadpdf' ,as: :donwload_pdf
  resources :myfiles 
    # get 'myfiles/downloadpdf/download'=> 'myfiles#downloadpdf'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

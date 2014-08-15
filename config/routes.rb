Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }, :path => 'u'
	devise_scope :user do
		authenticated :user do
			root :to => 'games#index'
		end
		unauthenticated :user do
			root :to => 'devise/registrations#new', as: :unauthenticated_root
		end
	end
	
  resources :users, :only => [:index]
	resources :games
end

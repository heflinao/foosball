Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
	devise_scope :user do
		authenticated :user do
			root :to => 'games#index'
		end
		unauthenticated :user do
			root :to => 'devise/registrations#new', as: :unauthenticated_root
		end
	end
	
	resources :games
	
end

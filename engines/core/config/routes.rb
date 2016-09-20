Kn::Core::Engine.routes.draw do
  mount_devise_token_auth_for "Kn::User", at: "auth"

  get "users/me", to: "users#show", as: :user
  put "users/me", to: "users#update", as: :update_user

  scope "users/me" do
    resources :contact_informations, except: [ :new, :edit ]
  end
end

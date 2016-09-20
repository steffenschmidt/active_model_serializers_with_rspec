Rails.application.routes.draw do
  mount Kn::Core::Engine => "/", as: "kn"
end

module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      sign_in user, scope: :user
      request.headers.merge!(user.create_new_auth_token)
    end
  end

  def set_engine_routes
    before(:each) do
      @routes = Kn::Core::Engine.routes
    end
  end
end

module Kn
  describe UsersController do
    set_engine_routes

    describe "GET #me" do
      context "as valid user" do
        login_user

        before(:each) do
          get :show
        end

        it "should have a current user" do
          expect(subject.current_kn_user).to_not eq nil
        end

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end

        it "returns the correct fields" do
          expect(json.keys).to eq ["id", "provider", "uid", "name", "image", "email", "created_at", "updated_at"]
        end

        it "returns the correct values" do
          expect(json["uid"]).to eq subject.current_kn_user.uid
          expect(json["name"]).to eq subject.current_kn_user.name
          expect(json["image"]).to eq subject.current_kn_user.image
          expect(json["email"]).to eq subject.current_kn_user.email
        end
      end

      context "with invalid user" do
        before(:each) do
          get :show
        end

        it "returns authentication error" do
          expect(response).to have_http_status(:unauthorized)
        end

        it "returns error message" do
          expect(json["errors"]).to eq ["Authorized users only."]
        end

        it "should not have a current user" do
          expect(subject.current_kn_user).to eq nil
        end
      end

    end

    describe "PUT #me" do

      context "with valid user" do
        login_user

        before(:each) do
          put :update, params: { user: { name: "Change User Name" } }
        end

        it "should have a current user" do
          expect(subject.current_kn_user).to_not eq nil
        end

        it "should change users user data" do
          subject.current_kn_user.reload
          expect(subject.current_kn_user.name).to eq "Change User Name"
        end

      end

      context "with invalid user" do
        before(:each) do
          put :update, params: { user: { name: "Change User Name" } }
        end

        it "returns authentication error" do
          expect(response).to have_http_status(:unauthorized)
        end

        it "returns error message" do
          expect(json["errors"]).to eq ["Authorized users only."]
        end

        it "should not have a current user" do
          expect(subject.current_kn_user).to eq nil
        end
      end

    end

  end
end

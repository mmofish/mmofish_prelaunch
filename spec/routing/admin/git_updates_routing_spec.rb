require "spec_helper"

describe Admin::GitUpdatesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/git_updates").should route_to("admin/git_updates#index")
    end

    it "routes to #new" do
      get("/admin/git_updates/new").should route_to("admin/git_updates#new")
    end

    it "routes to #show" do
      get("/admin/git_updates/1").should route_to("admin/git_updates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/git_updates/1/edit").should route_to("admin/git_updates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/git_updates").should route_to("admin/git_updates#create")
    end

    it "routes to #update" do
      put("/admin/git_updates/1").should route_to("admin/git_updates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/git_updates/1").should route_to("admin/git_updates#destroy", :id => "1")
    end

  end
end

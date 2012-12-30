require "spec_helper"

describe CrunchCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/crunch_companies").should route_to("crunch_companies#index")
    end

    it "routes to #new" do
      get("/crunch_companies/new").should route_to("crunch_companies#new")
    end

    it "routes to #show" do
      get("/crunch_companies/1").should route_to("crunch_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crunch_companies/1/edit").should route_to("crunch_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crunch_companies").should route_to("crunch_companies#create")
    end

    it "routes to #update" do
      put("/crunch_companies/1").should route_to("crunch_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crunch_companies/1").should route_to("crunch_companies#destroy", :id => "1")
    end

  end
end

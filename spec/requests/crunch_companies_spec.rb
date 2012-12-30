require 'spec_helper'

describe "CrunchCompanies" do
  describe "GET /crunch_companies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get crunch_companies_path
      response.status.should be(200)
    end
  end
end

require 'spec_helper'

describe "Admin::GitUpdates" do
  describe "GET /admin_git_updates" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_git_updates_path
      response.status.should be(200)
    end
  end
end

require 'spec_helper'

describe TopController do
  context :android_chrome do
    it "should include Intent for android chrome" do
      request.user_agent = 'Android Chrome'
      get :index
    end
  end
end

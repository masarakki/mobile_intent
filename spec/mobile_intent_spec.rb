require 'spec_helper'

describe MobileIntent do
  describe MobileIntent, ".config" do
    it { expect(MobileIntent.config).to be_a MobileIntent::Config }
  end

  describe MobileIntent, ".setup" do
    it 'register app' do
      expect {
        MobileIntent.setup do
          register :my_app, :android => 'com.example.myapp', :ios => 'myapp_name'
        end
      }.to change { MobileIntent.config.has? :my_app }.from(false).to(true)
    end
  end
end

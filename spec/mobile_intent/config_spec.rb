require 'spec_helper'

describe MobileIntent::Config do
  let(:config) { described_class.new }
  subject { config }
  before { config.send(:register, :app_name, :andorid => 'com.example.app') }

  describe :register do
    it { expect(config.send(:register, :app_name)).to be_a MobileIntent::Application }
    it { expect(config).to have(1).apps }
  end

  describe :has? do
    it { expect(subject).to be_has :app_name }
    it { expect(subject).not_to be_has :other_app }
  end
end

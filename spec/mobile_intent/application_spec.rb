require 'spec_helper'

describe MobileIntent::Application do
  subject { application }

  context :with_android do
    let(:application) { described_class.new :app_name, :android => 'com.example.myapp' }
    it { expect(subject).to be_android }
    it { expect(subject).not_to be_ios }
  end

  context :with_ios do
    let(:application) { described_class.new :app_name, :ios => 'myappname' }
    it { expect(subject).to be_ios }
    it { expect(subject).not_to be_android }
  end

end

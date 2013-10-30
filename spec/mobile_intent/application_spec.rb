require 'spec_helper'

describe MobileIntent::Application do
  let(:name) { :app_name }
  let(:android) { 'com.example.myapp' }
  let(:ios) { 'myappname' }
  subject { application }

  context :with_android do
    let(:application) { described_class.new name, android: android }
    it { expect(subject).to be_android }
    it { expect(subject).not_to be_ios }
    describe :intent_url do
      it { expect(subject.intent_url(:hoge)).to eq "#{name}://hoge" }
    end
    its(:android_market_url) { should eq "market://details?id=#{android}" }
    describe :android_intent_url do
      it { expect(subject.android_intent_url(:hoge)).to eq "intent://hoge#Intent;scheme=#{name};package=#{android};end" }
    end
    describe :ios_market_url do
      it { expect { subejct.ios_market_url }.to raise_error }
    end
  end

  context :with_ios do
    let(:application) { described_class.new name, ios: ios }
    it { expect(subject).to be_ios }
    it { expect(subject).not_to be_android }
    describe :intent_url do
      it { expect(subject.intent_url(:hoge)).to eq "#{name}://hoge" }
    end
    its(:ios_market_url) { should eq "itms://itunes.com/apps/#{ios}" }
    describe :android_market_url do
      it { expect { subject.android_market_url }.to raise_error }
    end
    describe :android_intent_url do
      it { expect { subject.android_intent_url(:hoge) }.to raise_error }
    end
  end

end
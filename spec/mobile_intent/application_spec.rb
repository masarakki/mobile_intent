require 'spec_helper'

describe MobileIntent::Application do
  let(:name) { :app_name }
  let(:android) { 'com.example.myapp' }
  let(:ios) { 1212121 }
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

    describe :launch_url do
      context :android_chrome do
        it { expect(subject.launch_url(:hoge, 'Android Chrome')).to eq subject.android_intent_url(:hoge) }
      end
      context :old_android do
        it { expect(subject.launch_url(:hoge, 'Android Unko')).to eq subject.intent_url(:hoge) }
      end
    end
  end

  context :with_ios do
    let(:application) { described_class.new name, ios: ios }
    it { expect(subject).to be_ios }
    it { expect(subject).not_to be_android }
    describe :intent_url do
      it { expect(subject.intent_url(:hoge)).to eq "#{name}://hoge" }
    end
    its(:ios_market_url) { should eq "http://itunes.apple.com/app/id#{ios}" }
    describe :android_market_url do
      it { expect { subject.android_market_url }.to raise_error }
    end
    describe :android_intent_url do
      it { expect { subject.android_intent_url(:hoge) }.to raise_error }
    end
  end

end

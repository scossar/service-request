require 'spec_helper'

RSpec.describe "TestelevenHomepage::App::Page::NewWebsiteHelper" do
  pending "add some examples to (or delete) #{__FILE__}" do
    let(:helpers){ Class.new }
    before { helpers.extend TestelevenHomepage::App::Page::NewWebsiteHelper }
    subject { helpers }

    it "should return nil" do
      expect(subject.foo).to be_nil
    end
  end
end

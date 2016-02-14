require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.create(content: "hello world!")
  end
  
  subject { @micropost } 
  
  it { should respond_to(:content) }
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  its(:user) { should eq user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @micropost.user_id = nil } 
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @micropost.content = " " }
    it { should_not be_valid }
  end
  
  describe "with content that is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end
  
  it "should destroy associated microposts" do
      microposts = user.microposts.to_a
      user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |micropost|
        expect(Micropost.where(id: micropost.id)).to be_empty
      end
  end
end

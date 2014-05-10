require 'user'
require 'spec_helper'

describe User do
  it "should have a name when it is created" do
    expect(User.count).to eq 0
    User.create(:name =>"Will")
    expect(User.count).to eq 1
    user = User.first
    expect(user.name).to eq "Will"
    user.destroy
    expect(User.count).to eq 0
  end

  it "should have an email when it is created" do
    expect(User.count).to eq 0
    User.create(:name =>"Will", :email => "willhall88@hotmail.com")
    expect(User.count).to eq 1
    user = User.first
    expect(user.email).to eq "willhall88@hotmail.com"
    user.destroy
    expect(User.count).to eq 0
  end

end
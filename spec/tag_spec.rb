require 'tag'
require 'spec_helper'

describe Tag do 
  it"should have a tagname when it is created" do
    expect(Tag.count).to eq 0
    Tag.create(:name =>"codeschool")
    expect(Tag.count).to eq 1
    tag = Tag.first
    expect(tag.name).to eq "codeschool"
    tag.destroy
    expect(Tag.count).to eq 0
  end
end
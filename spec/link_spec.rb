require 'spec_helper'

describe Link do
  
  context "demonstration of datamapper" do
    it 'should be created and then retrieved from the db' do
      expect(Link.count).to eq(0)
      Link.create(:title => "Makers Academy", 
                  :url => "http://www.makersacademy.com/")
      expect(Link.count).to eq(1)
      link = Link.first
      expect(link.url).to eq("http://www.makersacademy.com/")
      expect(link.title).to eq("Makers Academy")
      link.destroy
      expect(Link.count).to eq(0)
    end
  end

   it 'one link should have some tags' do
    tags = [Tag.create(:name =>"tag1"), Tag.create(:name => "tag2")]
    link = Link.create(:title => "Makers Academy", 
                :url => "http://www.makersacademy.com/",
                :tags => tags)
    expect(link.tags.map(&:name)).to include("tag1")
    expect(link.tags.map(&:name)).to include("tag2")

   end
end
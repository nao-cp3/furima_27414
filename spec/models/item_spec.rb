require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    
    it "is invalid without name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without text" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "is invalid without prices" do
      item = build(:item, prices: nil)
      item.valid?
      expect(item.errors[:prices]).to include("can't be blank")
    end

    it "is invalid without image" do
      item = build(:item, image: nil)
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end


  end
end

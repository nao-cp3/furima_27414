require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    before do 
      item = Item.new(name: "item", text: "aaa", prices: "1000", category_id: "2", condition_id: "2", postage_id: "2", prefecture_id: "2", several_days_id: "2")
      item.save
    end
    
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

    it "is invalid without category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("is not a number")
    end

    it "is invalid without condition_id" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("is not a number")
    end

    it "is invalid without postage_id" do
      item = build(:item, postage_id: nil)
      item.valid?
      expect(item.errors[:postage_id]).to include("is not a number")
    end

    it "is invalid without prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("is not a number")
    end

    it "is invalid without several_days_id" do
      item = build(:item, several_days_id: nil)
      item.valid?
      expect(item.errors[:several_days_id]).to include("is not a number")
    end
  end
end

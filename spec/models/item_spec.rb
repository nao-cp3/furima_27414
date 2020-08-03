require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    before do 
      @item = FactoryBot.build(:item)
      @item.save
    end
    
    it "is invalid without name" do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without text" do
      @item.text =  nil
      @item.valid?
      expect(@item.errors[:text]).to include("can't be blank")
    end

    it "is invalid without prices" do
      @item.prices = nil
      @item.valid?
      expect(@item.errors[:prices]).to include("can't be blank")
    end

    it "is invalid without image" do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end

    it "is invalid without category_id" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include("must be other than 1")
    end

    it "is invalid without condition_id" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors[:condition_id]).to include("must be other than 1")
    end

    it "is invalid without postage_id" do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors[:postage_id]).to include("must be other than 1")
    end

    it "is invalid without prefecture_id" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("must be other than 1")
    end

    it "is invalid without several_days_id" do
      @item.several_days_id = 1
      @item.valid?
      expect(@item.errors[:several_days_id]).to include("must be other than 1")
    end

    it "is invalid without user_id" do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors[:user_id]).to include()
    end
  end
end

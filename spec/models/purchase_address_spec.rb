require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do 
    @purchase_address = FactoryBot.build(:purchase_address)
    @purchase_address.save
  end

  it "postal_codeがない場合は登録できないこと" do
    @purchase_address.postal_code = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
    @purchase_address.postal_code = '1234567'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include include hyphen(-)")
  end

  it "prefecture_idが1だと登録できないこと" do
    @purchase_address.prefecture_id = 1
    @purchase_address.valid?
    expect(@purchase_address.errors[:prefecture_id]).to include("must be other than 1")
  end

  it "cityがない場合は登録できないこと" do
    @purchase_address.city = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("City can't be blank")
  end

  it "addressがない場合は登録できないこと" do
    @purchase_address.address = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
  end

  it "telephoneがない場合は登録できないこと" do
    @purchase_address.telephone = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
  end

  it "buildingは空でも保存できること" do
    @purchase_address.building = nil
    expect(@purchase_address).to be_valid
  end

  it "telephoneが11桁の場合は登録できること" do
    @purchase_address.telephone = "01234567890"
    expect(@purchase_address).to be_valid
  end

  it "telephoneが12桁以上の場合は登録できないこと" do
    @purchase_address.telephone = "012345678910"
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Telephone is too long (minimum is 11 characters)")
  end

end

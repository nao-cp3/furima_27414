require 'rails_helper'

describe User do
  describe '#create' do

    before do 
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000")
      user.save
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "is invalid without a firstname" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "is invalid without a lastname" do
      user = build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it "is invalid without a firstname_kana" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it "is invalid without a lastname_kana" do
      user = build(:user, lastname_kana: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it "is invalid without a birthdate" do
      user = build(:user, birthdate: nil)
      user.valid?
      expect(user.errors[:birthdate]).to include("can't be blank")
    end

    it "firstname_kanaがカタカナで返ること" do
      user = build(:user, firstname_kana: "kana")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("is must NOT contain any other characters than alphanumerics.")
    end

    it "lastname_kanaがカタカナで返ること" do
      user = build(:user, lastname_kana: "kana")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("is must NOT contain any other characters than alphanumerics.")
    end
  end
end
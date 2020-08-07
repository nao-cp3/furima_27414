class PurchaseAddress

    include ActiveModel::Model
    attr_accessor :token, :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :address, :building, :telephone, :commit, :item_id, :user_id

  with_options presence: true do
    validates :city, :address, :postal_code, :telephone
  end

  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include include hyphen(-)"}
  validates :telephone, format: { with: /\A\d{11}\z/, message: "is too long (minimum is 11 characters)"}

  def save
    Purchase.create(
      user_id: user_id,
      item_id: item_id
    )
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      telephone: telephone,
      )
  end
end
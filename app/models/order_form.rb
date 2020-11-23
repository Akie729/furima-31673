class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}  
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :token, presence: true

  def save
    # binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    Adress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, order_id: order.id)
  end
end
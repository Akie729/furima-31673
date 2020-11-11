class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :password, presence: true, format: { with: /[a-z\d]/i , message: "半角英数字混合での入力が必須です" }
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角（漢字・ひらがな・カタカナ）で入力してください" } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください" } do
    validates :first_name_kana
    validates :last_name_kana
  end

  
end

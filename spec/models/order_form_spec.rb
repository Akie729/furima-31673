require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @orderform = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '郵便番号・都道府県・市区町村・番地・電話番号・tokenがあれば購入できる' do
        expect(@orderform).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空では保存できないこと' do
        @orderform.token = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できない' do
        @orderform.postal_code = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に-(ハイフン)が含まれていないと保存できない' do
        @orderform.postal_code = '111111'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include('Postal code はハイフンを含んでください')
      end

      it '都道府県が１では保存できない' do
        @orderform.prefecture_id = '1'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村がないと保存できない' do
        @orderform.city = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと保存できない' do
        @orderform.house_number = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がないと保存できない' do
        @orderform.phone = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は11桁ないと保存できない' do
        @orderform.phone = '123456789'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include('Phone は１１桁の数字を入力してください')
      end
    end
  end
end

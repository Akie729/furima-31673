require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '新規登録がうまくいくとき' do
      it 'nameとdescriptionとcategory_idとcondition_idとdelivary_fee_idとprefecture_idとdays_to_ship_idとpriceとimageが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it '商品名がないと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空だと保存できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryは１を選択したら保存できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'conditionは１を選択したら保存できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'delivary_feeは１を選択したら保存できない' do
        @item.delivary_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary fee must be other than 1")
      end

      it 'days_to_shipがは１を選択したら保存できない' do
        @item.days_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end

      it 'prefectureは１を選択したら保存できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'priceが入力されていないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300以上でないと保存できない' do
        @item.price = '30'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it 'priceが¥9,999,999以下でないと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは半角数字でないと保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end

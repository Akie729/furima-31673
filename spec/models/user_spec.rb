require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "name、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上、英数字混合で登録できる" do
        @user.password = "aaa1234"
        @user.password_confirmation = "aaa1234"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスは、@を含んでいないと登録できない" do
        @user.email = "aaabbbccc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email は@が含まれていることが必要です")
      end

      it "パスワードが空だと登録ができない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが５文字以下だと新規登録できない" do
        @user.password = "aaa12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは、半角英数字混合での入力でないと新規登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Password は英数字混合で入力してください")
      end


      it "パスワードとパスワード（確認用）、値の一致していないと新規登録できない" do
        @user.password_confirmation= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
   
    
      it "ユーザー本名は名字と名前が両方ないと新規登録できない" do
        @user.last_name= "あべ"
        @user.first_name= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）でないと新規登録できない" do
        @user.last_name = "abe"
        @user.first_name= "aki"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）で入力してください", "Last name は全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "ユーザー本名のフリガナは、名字と名前が両方ないと新規登録できない" do
        @user.last_name_kana = "アベ"
        @user.first_name_kana= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "ユーザー本名のフリガナは、全角（カタカナ）でないと新規登録できない" do
        @user.last_name_kana = "あべ"
        @user.first_name_kana= "あき"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください", "Last name kana は全角カタカナで入力してください")
      end

      it "生年月日が空だと新規登録できない" do
        @user.birth_date = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end





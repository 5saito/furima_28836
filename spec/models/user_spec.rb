require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録うまくいく時" do
      it "ニックネーム、メール、パスワード、姓、名、姓カナ、名カナ、誕生日が存在すれば、登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスは@を含む" do
        @user.email
        expect(@user).to be_valid '@'
      end
      it "パスワードは6文字以上である" do
        @user.password = 123456
        @user.password_confirmation = 123456
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合である" do
        @user.password = /\A[a-zA-Z0-9]+\z/
        expect(@user).to be_valid
      end
    end

    context "新規登録うまくいかない時" do
      it "ニックネームが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickame can't be blank")
      end
      it "Emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "パスワードが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが英子文字が含まれないと登録できない" do
        @user = (password: '1'+'A' *5, password_confirmation: '1A'+'a' *3)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "パスワードが5文字以下だと登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "重複したメールアドレスの場合、登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "family_nameが半角の場合、登録できない" do
        @user.family_name = /\A[ｧ-ﾝﾞﾟ]+\z/
        @user.valid?
        expect(@user.errors.full_message).to include("Last name Full-width characters")
      end
      it "first_nameが半角の場合、登録できない" do
        @user.first_name = /\A[ｧ-ﾝﾞﾟ]+\z/
        @user.valid?
        expect(@user.errors.full_message).to include("First name Full-width characters")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "family_name_kanaが全角でない場合、登録できない" do
        @user.family_name_kana = /\A[ぁ-んァ-ン一-龥]+\z/
        @user.valid?
        expect(@user.errors.full_message).to include("Last name kana Full-width katakana characters")
      end
      it "first_name_kanaが全角でない場合、登録できない" do
        @user.first_name_kana = /\A[ぁ-んァ-ン一-龥]+\z/
        @user.valid?
        expect(@user.errors.full_message).to include("First name kana Full-width katakana characters")
      end 
      it "誕生日が空だと登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_message).to include("Birth date can't be blank")
      end
    end
  end
end

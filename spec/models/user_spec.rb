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
        expect(@user).to be_valid
      end
      it "パスワードは6文字以上である" do
        @user.password = 123456
        @user.password_confirmation = 123456
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合である" do
        @user.password
        expect(@user).to be_valid
      end
    end

    context "新規登録うまくいかない時" do
      it "ニックネーム、メール、パスワード、姓、名、姓カナ、名カナ、誕生日がない場合、登録できない" do
        @user = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
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
        @user.family_name
        @user.valid?
        expect(@user.errors.full_message).to include("は全角で入力してください")
      end
      it "first_nameが半角の場合、登録できない" do
        @user.first_name
        @user.valid?
        expect(@user.errors.full_message).to include("は全角で入力してください")
      end
      it "family_nameが全角でない場合、登録できない" do
        @user.family_name
        @user.valid?
        expect(@user.errors.full_message).to include("はカタカナで入力してください")
      end
      it "first_nameが全角でない場合、登録できない" do
        @user.first_name
        @user.valid?
        expect(@user.errors.full_message).to include("はカタカナで入力してください")
      end 
    end
  end
end

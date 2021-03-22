require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネーム・メールアドレス・パスワード・パスワード(確認)・性別・生年月日が存在すれば登録できる。' do
        expect(@user).to be_valid
      end
      it 'パスワード・パスワード(確認)が英数字混合6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameは必須です")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは必須です")
      end

      it 'パスワードが存在しても、パスワード(確認)が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it '性別が空では登録できない' do
        @user.gender_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Genderは必須です")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayは必須です")
      end
      it 'メールアドレスが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailが既に登録されています')
      end
      it 'メールアドレスに@が存在しなければ登録できない' do
        @user.email = 'aaabbb.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailは正しく入力してください')
      end
      it 'パスワード・パスワード(確認)が半角英字のみの入力では登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordはアルファベットと数字を含む6文字以上必要です')
      end
      it 'パスワード・パスワード(確認)が半角数字のみの入力では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordはアルファベットと数字を含む6文字以上必要です')
      end
      it 'パスワードとパスワード(確認)の値が一致していなければ登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
    end
  end

end

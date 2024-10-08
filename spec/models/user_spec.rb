require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,
      first_name,last_name,first_name_rub,last_name_rub,birthday
      が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_rubが空では登録できない' do
        @user.first_name_rub = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name rub can't be blank")
      end

      it 'last_name_rubが空では登録できない' do
        @user.last_name_rub = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name rub can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include(a_string_matching(/Password\s+is invalid. Include both letters and numbers/))
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = 111_111
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include(a_string_matching(/Password\s+is invalid. Include both letters and numbers/))
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'ＡＡＡＡＡＡ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include(a_string_matching(/Password\s+is invalid. Include both letters and numbers/))
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'emailemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameが半角文字では登録できない' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it 'last_nameが半角文字では登録できない' do
        @user.last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      it 'first_name_rubに全角カタカナ以外が含まれていると登録できない' do
        @user.first_name_rub = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name rub  is invalid. Input full-width characters')
      end

      it 'last_name_rub全角カタカナ以外が含まれていると登録できない' do
        @user.last_name_rub = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include(a_string_matching(/Last name rub\s+is invalid. Input full-width characters/))
      end
    end
  end
end
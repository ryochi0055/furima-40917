require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'メールアドレスが必須である' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      user1 = User.create(nickname: 'test1', email: 'test@example.com', password: '000000', password_confirmation: '000000', birthday: '2000-01-01', last_name: '山田', first_name: '太郎', last_name_rub: 'ヤマダ', first_name_rub: 'タロウ')
      user2 = User.new(nickname: 'test2', email: 'test@example.com', password: '000000', password_confirmation: '000000', birthday: '2000-01-01', last_name: '鈴木', first_name: '次郎', last_name_rub: 'スズキ', first_name_rub: 'ジロウ')
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'メールアドレスは＠を含む必要があること' do
      user = User.new(nickname: 'test', email: 'testexample.com', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが必須であること' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは６文字以上で入力が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example', password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードとパスワード（確認）は値が一致必須であること' do
    end

  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'userモデル単体テスト' do
    context '内容に問題がない場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'avatarが空でも更新できる' do
        @user.avatar = nil
        expect(@user).to be_valid
      end
      it 'cameraが空でも更新できる' do
        @user.camera = ''
        expect(@user).to be_valid
      end
      it 'camera_careerが空でも更新できる' do
        @user.camera_career = ''
        expect(@user).to be_valid
      end
      it 'model_careerが空でも更新できる' do
        @user.model_career = ''
        expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordはアルファベットだけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
      end
      it 'nameが41文字以上では更新できない' do
        @user.name = Faker::Lorem.characters(number: 41)
        @user.valid?
        expect(@user.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      it 'cameraが41文字以上では更新できない' do
        @user.camera = Faker::Lorem.characters(number: 41)
        @user.valid?
        expect(@user.errors.full_messages).to include 'Camera is too long (maximum is 40 characters)'
      end
      it 'camera_careerが41文字以上では更新できない' do
        @user.camera_career = Faker::Lorem.characters(number: 41)
        @user.valid?
        expect(@user.errors.full_messages).to include 'Camera career is too long (maximum is 40 characters)'
      end
      it 'model_careerが41文字以上では更新できない' do
        @user.model_career = Faker::Lorem.characters(number: 41)
        @user.valid?
        expect(@user.errors.full_messages).to include 'Model career is too long (maximum is 40 characters)'
      end
    end
  end
end

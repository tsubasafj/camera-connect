require 'rails_helper'

RSpec.describe Board, type: :model do
  before do
    @board = FactoryBot.build(:board)
  end

  describe '掲示板投稿' do
    context '投稿できる場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@board).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'titleが空では投稿できない' do
        @board.title = ""
        @board.valid?
        expect(@board.errors.full_messages).to include "Title can't be blank"
      end
      it 'titleが41文字以上では投稿できない' do
        @board.title = Faker::Lorem.characters(number: 41)
        @board.valid?
        expect(@board.errors.full_messages).to include "Title is too long (maximum is 40 characters)"
      end
      it 'contentが空では投稿できない' do
        @board.content = ""
        @board.valid?
        expect(@board.errors.full_messages).to include "Content can't be blank"
      end
      it 'contentが1001文字以上では投稿できない' do
        @board.content = Faker::Lorem.characters(number: 1001)
        @board.valid?
        expect(@board.errors.full_messages).to include "Content is too long (maximum is 1000 characters)"
      end
      it 'want_idが1では投稿できない' do
        @board.want_id = 1
        @board.valid?
        expect(@board.errors.full_messages).to include "Want must be other than 1"
      end
      it 'prefecture_idが1では投稿できない' do
        @board.prefecture_id = 1
        @board.valid?
        expect(@board.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'userが紐づいていないと投稿できない' do
        @board.user = nil
        @board.valid?
        expect(@board.errors.full_messages).to include "User must exist"
      end
    end
  end
end

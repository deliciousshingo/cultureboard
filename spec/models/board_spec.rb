require 'rails_helper'

RSpec.describe Board, type: :model do
  describe '投稿機能の登録' do
    before do
      @board = FactoryBot.build(:board)
      @board.image = fixture_file_upload('Railsの処理の流れ_0409.png')
    end
    context '投稿がうまくいくとき' do
      it 'すべての値が正しく入力されていれば投稿できること' do
        expect(@board).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'titleが空だと登録できないこと' do
        @board.title = ''
        @board.valid?
        expect(@board.errors.full_messages).to include
      end
      it 'imageが空だと登録できないこと' do
        @board.image = nil
        @board.valid?
        expect(@board.errors.full_messages).to include
      end
      it 'informationが空だと登録できないこと' do
        @board.information = ''
        @board.valid?
        expect(@board.errors.full_messages).to include
      end
      it 'genreを選択していないと登録できないこと' do
        @board.genre_id = 0
        @board.valid?
        expect(@board.errors.full_messages).to include("Genre can't be blank")
      end
    end
  end
end

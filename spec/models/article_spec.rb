require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿機能' do
    context '記事投稿できる時' do
      it '画像・タイトル・本文・ペット種類・記事種類・公開設定が存在すれば登録できる' do
        expect(@article).to be_valid
      end
    end
    context '記事投稿出来ない時' do
      it '画像が空だと登録できない' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Imageを入力してください")
      end
      it 'タイトルが空だと登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Titleを入力してください")
      end
      it '本文が空だと登録できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Textを入力してください")
      end
      it 'ペット種類が---だと登録できない' do
        @article.pet_type_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('Pet typeを選択してください')
      end
      it '記事種類が---だと登録できない' do
        @article.text_type_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('Text typeを選択してください')
      end
      it '公開設定が未選択だと登録できない' do
        @article.publishing_setting_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('Publishing settingを選択してください')
      end
    end
  end
end

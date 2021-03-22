require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe '予定・記録保存機能' do
    context '保存できる時' do
      it 'タイトル・テキスト・種類が存在し、種類が予定で日時が未来日なら登録できる' do
        @task.task_type_id = 1
        @task.datetime = DateTime.now + 1.second
        expect(@task).to be_valid
      end
      it 'タイトル・テキスト・種類が存在し、種類が記録で日時が当日なら登録できる' do
        @task.task_type_id = 2
        @task.datetime = DateTime.now
        expect(@task).to be_valid
      end
      it 'タイトル・テキスト・種類が存在し、種類が記録で日時が過去日なら登録できる' do
        @task.task_type_id = 2
        @task.datetime = DateTime.now - 1.second
        expect(@task).to be_valid
      end
      it 'テキストが空でも登録できる' do
        @task.content = nil
        expect(@task).to be_valid
      end
    end
    context '保存出来ない時' do
      it '日時が空だと登録できない' do
        @task.datetime = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Datetime can't be blank")
      end
      it 'タイトルが空だと登録できない' do
        @task.title = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Title can't be blank")
      end
      it '種類が空だと登録できない' do
        @task.task_type = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Task type can't be blank")
      end
      it '通知設定が空だと登録できない' do
        @task.notice_id = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Notice can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @plan = FactoryBot.create(:plan)
    @comment = FactoryBot.build(:comment, user_id: @user.id, plan_id: @plan.id)
  end

  describe 'コメントの登録' do
    context 'コメント登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント登録ができないとき' do
      it 'ユーザー登録している人でないと登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'スケジュール投稿している人でないと登録できない' do
        @comment.plan = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Plan must exist')
      end
      it '文章が空欄だと登録できない' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end

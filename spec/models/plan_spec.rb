require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @plan = FactoryBot.build(:plan, user_id: @user.id)
  end

  describe 'スケジュールの登録' do
    context 'スケジュール登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@plan).to be_valid
      end
    end

    context 'スケジュール登録ができないとき' do
      it 'ユーザー登録している人でないと登録できない' do
        @plan.user = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include('User must exist')
      end
      it 'タイトル名が空欄だと登録できない' do
        @plan.title = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Title can't be blank")
      end
      it '詳細が空欄だと登録できない' do
        @plan.detail = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Detail can't be blank")
      end
      it '目標が空欄だと登録できない' do
        @plan.goal = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Goal can't be blank")
      end
      it '日付が空欄だと登録できない' do
        @plan.start_time = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Start time can't be blank")
      end
    end
  end
end

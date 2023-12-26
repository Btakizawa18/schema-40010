class Plan < ApplicationRecord
  # テーブルとのアソシエーション
  belongs_to :user

  # active_storageとのアソシエーション
  has_one_attached :image

  # 空では保存できない
  with_options presence: true do
    validates :title
    validates :detail
    validates :goal
    validates :start_time
  end
end

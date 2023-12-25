class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title,        null: false
      t.text :detail,         null: false
      t.string :goal,         null: false
      t.datetime :start_time, null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end

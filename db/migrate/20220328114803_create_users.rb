class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :uid, null: false, default: ''
      t.index :uid, unique: true # 同じuidによる登録を防ぐ

      t.timestamps
    end
  end
end

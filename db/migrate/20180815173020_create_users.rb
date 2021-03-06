class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname,               null: false, limit: 20
      t.string :password_digest,        null: false

      t.timestamps
    end

    add_index :users, :nickname,        unique: true
    add_index :users, :password_digest, unique: true
  end
end

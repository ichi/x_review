class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.references :user, foreign_key: true
      t.string :provider, null: false
      t.string :uid,      null: false
      t.string :token
      t.datetime :token_expires_at
      t.json :params

      t.timestamps null: false
    end

    add_index :authentications, [:provider, :uid], unique: true
  end
end

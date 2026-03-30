class CreateUsermessages < ActiveRecord::Migration[7.0]
  def change
    create_table :usermessages do |t|
      t.text :message
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

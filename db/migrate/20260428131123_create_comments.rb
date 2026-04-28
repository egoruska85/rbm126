class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :work, null: false, foreign_key: true
      t.string :author
      t.text :message

      t.timestamps
    end
  end
end

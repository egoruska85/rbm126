class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :phone
      t.string :max
      t.string :telegramm
      t.string :vk
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end

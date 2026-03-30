class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :enail
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end

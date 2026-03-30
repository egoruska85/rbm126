class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :service, null: false, foreign_key: true
      t.string :name
      t.text :desc
      t.string :phone
      t.boolean :completed
      t.boolean :accepted
      t.text :answer

      t.timestamps
    end
  end
end

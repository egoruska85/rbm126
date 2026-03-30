class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :about
      t.string :slogan
      t.string :address

      t.timestamps
    end
  end
end

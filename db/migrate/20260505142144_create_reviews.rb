class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :message
      t.string :email
      t.integer :rating

      t.timestamps
    end
  end
end

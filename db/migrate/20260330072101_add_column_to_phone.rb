class AddColumnToPhone < ActiveRecord::Migration[7.0]
  def change
    add_column :phones, :whatsapp, :string
    add_column :phones, :imo, :string
  end
end

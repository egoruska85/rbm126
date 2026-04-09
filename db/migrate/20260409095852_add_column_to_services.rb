class AddColumnToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :numeric, :integer
  end
end

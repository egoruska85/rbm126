class AddColumnToEnters < ActiveRecord::Migration[7.0]
  def change
    add_column :enters, :svg, :string
    add_column :enters, :path1, :text
    add_column :enters, :path2, :text
  end
end

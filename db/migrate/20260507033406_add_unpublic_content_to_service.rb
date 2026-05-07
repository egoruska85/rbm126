class AddUnpublicContentToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :public, :boolean
  end
end

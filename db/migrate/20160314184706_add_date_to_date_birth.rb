class AddDateToDateBirth < ActiveRecord::Migration
  def change
    remove_column :activists, :birth_date
  end
end

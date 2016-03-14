class AddColumnDateBirth < ActiveRecord::Migration
  def change
    add_column :activists, :birth_date, :date
  end
end

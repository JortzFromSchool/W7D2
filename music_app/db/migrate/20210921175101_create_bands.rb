class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
  end
end

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :category
      t.float :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

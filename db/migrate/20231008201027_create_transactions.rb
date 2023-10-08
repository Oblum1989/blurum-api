class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.float :value
      t.string :description
      t.references :transactionable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

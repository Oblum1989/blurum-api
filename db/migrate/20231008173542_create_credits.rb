class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.string :name
      t.float :debt
      t.float :fee
      t.float :payment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

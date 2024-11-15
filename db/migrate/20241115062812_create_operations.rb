class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.references :payer,     null: false, foreign_key: { to_table: :user_accounts }
      t.references :payee,     null: false, foreign_key: { to_table: :user_accounts }
      t.references :currency,  null: false, foreign_key: true
      t.decimal    :amount,    null: false, precision: 10, scale: 2
      t.integer    :status,    null: false

      t.timestamps
    end
  end
end

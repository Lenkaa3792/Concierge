class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.date :order_date
      t.string :status
      t.decimal :total_amount

      t.timestamps
    end
  end
end

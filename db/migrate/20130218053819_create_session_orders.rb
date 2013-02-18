class CreateSessionOrders < ActiveRecord::Migration
  def change
    create_table :session_orders do |t|
      t.string :order_id
      t.integer :session_id
      t.text :choosed_seats
      t.decimal :expense
      t.string :status
      t.string :mobile

      t.timestamps
    end
  end
end

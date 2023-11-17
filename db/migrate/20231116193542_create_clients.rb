class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :preferred_contact

      t.timestamps
    end
  end
end

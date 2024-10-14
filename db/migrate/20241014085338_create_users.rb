class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :encrypted_email
      t.string :encrypted_phone_number

      t.timestamps
    end
  end
end

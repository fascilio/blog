class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email

      t.timestamps
    end
    add_index :profiles, :username
    add_index :profiles, :email
  end
end

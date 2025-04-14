class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest  # Change from user_password to password_digest
      t.timestamps
    end

    add_index :users, :email, unique: true  # Optional but recommended
  end
end
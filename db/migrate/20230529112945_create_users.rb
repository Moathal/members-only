class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.text :bio

      t.timestamps
    end
  end
end

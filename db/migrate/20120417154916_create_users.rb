class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :key
      t.string :secret

      t.timestamps
    end
  end
end

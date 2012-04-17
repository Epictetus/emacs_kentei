class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.string :correct
      t.string :wrong1
      t.string :wrong2
      t.string :wrong3

      t.timestamps
    end
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :problem_id
      t.string :choice
      t.boolean :correct

      t.timestamps
    end
  end
end

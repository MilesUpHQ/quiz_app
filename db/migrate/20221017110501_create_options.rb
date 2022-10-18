class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.references :question
      t.timestamps
    end
  end
end

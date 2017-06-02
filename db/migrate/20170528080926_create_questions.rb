class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.belongs_to :user, index: true	
      t.string :question
      t.boolean :featured
      t.boolean :display
      t.integer :views
      t.boolean :favourite
      t.timestamps
    end
  end
end

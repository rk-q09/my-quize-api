class CreateQuizes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizes do |t|
      t.string :title, null: false
      t.references :user

      t.timestamps
    end
  end
end

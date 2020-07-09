class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false

      t.timestamps
    end

    add_index :courses, :title, unique: true
  end
end

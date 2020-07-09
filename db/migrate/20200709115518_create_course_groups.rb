class CreateCourseGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :course_groups do |t|
      t.string :title, null: false
      t.integer :course_id, null: false
      t.string :course_title, null: false
      t.datetime :started_at, null: false
      t.integer :users_count, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :course_groups, :courses

    add_index :course_groups, :course_id
    add_index :course_groups, :started_at
    add_index :course_groups, [:title, :course_id], unique: true
  end
end

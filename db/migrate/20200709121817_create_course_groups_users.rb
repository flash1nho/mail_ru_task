class CreateCourseGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :course_groups_users do |t|
      t.integer :course_group_id, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_foreign_key :course_groups_users, :course_groups

    add_index :course_groups_users, :course_group_id
    add_index :course_groups_users, [:course_group_id, :email], unique: true
  end
end

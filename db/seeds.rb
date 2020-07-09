# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  %w(Математика Физика Химия).each do |title|
    course = Course.create!(title: title)

    course_group1 = CourseGroup.create!(course_id: course.id, title: 'Утренняя группа', started_at: "#{Time.now.to_date} 09:00:00")
    course_group2 = CourseGroup.create!(course_id: course.id, title: 'Вечерняя группа', started_at: "#{Time.now.to_date} 19:00:00")

    CourseGroupsUser.create!(course_group_id: course_group1.id, email: 'student1@example.com')
    CourseGroupsUser.create!(course_group_id: course_group2.id, email: 'student2@example.com')
    CourseGroupsUser.create!(course_group_id: course_group2.id, email: 'student3@example.com')
  end
end

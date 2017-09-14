require 'csv'
class College

    def self.create_college(college_name,college_contact,count_of_courses)
       CSV.open("colleges.csv", "a+") do |csv|
        csv << [college_name,college_contact, count_of_courses]
        end
    end


    def self.create_course(course_name,college_name,student_capacity)
      CSV.open("courses.csv", "a+") do |csv|
       csv << [course_name,college_name,student_capacity]
       end
    end
end

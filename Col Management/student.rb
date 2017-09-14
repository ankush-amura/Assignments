require 'csv'
class Student

   def self.create_student(student_name,student_contact,course,college_name)
     CSV.open('students.csv','a+') do |csv|
         csv << [student_name,student_contact,course,college_name]
     end
   end

end

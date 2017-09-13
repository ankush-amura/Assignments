require_relative 'college'
require_relative 'student'
class Management
   def self.manage
     while true do
     puts "---------------------------------- Management System ---------------------------------"
     puts "1.Add College To The Desk"
     puts "2.Add Course To The Desk"
     puts "3.Add Student To The Desk"
     puts "4.Search"
     puts "--------------------------------------------------------------------------------------"
     puts "Enter Your Choice:"
     choice = gets.chomp
     case choice
       when "1"
          flag=true
          while(flag == true )
            puts "enter college name : "
            college_name = gets.chomp
            flag=false
            CSV.read('colleges.csv').each do |record|
               if(record[0]==college_name)
                 puts "The College Name AreadY Exists !!!!!! Please Reenter Details"
                 flag = true
               end
            end
          end
          puts "enter the contact: "
          contact =gets.chomp
          puts "enter the number of courses available: "
          num_courses=gets.chomp
          College.create_college(college_name,contact,num_courses)
       when "2"
          flag=true
          while(flag == true )
            puts "enter the course name: "
            course_name = gets.chomp
            puts "enter the college name: "
            college_name = gets.chomp
            flag=false
            CSV.read('courses.csv').each do |record|
               if(record[0]==course_name and record[1]==college_name)
                 puts "The College Name With this course AreadY Exists !!!!!! Please Reenter Details"
                 flag = true
               end
            end
          end

          puts  "enter the capacity: "
          capacity =gets.chomp
          College.create_course(course_name,college_name,capacity)
       when "3"
          flag=true
          while(flag == true )
            puts "enter the student name: "
            student_name = gets.chomp
            flag=false
            CSV.read('students.csv').each do |record|
               if(record[0]==student_name)
                 puts "The Student With This Name AreadY Exists !!!!!! Please Reenter Details"
                 flag = true
               end
            end
          end
          puts "Enter Course Name:  "
          course_name = gets.chomp
          puts "Enter College Name: "
          college_name = gets.chomp
          puts "Enter Contact:      "
          contact = gets.chomp
          Student.create_student(student_name,course_name,college_name,contact)
       when "4"
          Management.search
       else
          puts "Invalid Choice...."
     end
   end
end
  def self.search
       puts "----------------------------------- Search Desk ---------------------------------"
       puts "1. Search For College"
       puts "2. Search For Student"
       puts "3. Search For Course"
       puts "---------------------------------------------------------------------------------"
       puts "Enter Your Choice: "
       choice = gets.chomp
       case choice
         when "1"
           puts "enter the name of the college: "
           college = gets.chomp
           flag=false
           CSV.read('colleges.csv').each_with_index do |row,index|
             if( row[0].include? college )
                flag = true
                puts"College Found At Record Number: #{index}"
                puts"Fetching All Courses Provided By This College............"
                puts"-----------------------Courses Available----------------------"
                 CSV.read('courses.csv').each do |row|
                    if(row[1].include? college)
                      puts "course: "+row[0]
                    end
                 end
              end
            end
            if(flag== false)
              puts "--------------No Records Found Related Your Search-----------------"
            end

         when "2"
           puts "Enter The Student Name: "
           student = gets.chomp
           flag=false;
           CSV.read('students.csv').each do |row|
              if(row[0].include? student)
                 flag=true;
                 puts "---------------------Printing Student Details--------------------"
                 puts "Student Name: "+row[0]
                 puts "Student Contact: "+row[1]
                 puts "Student Course:  "+row[2]
                 puts "student College Allocated: "+row[3]
                 puts "-----------------------------------------------------------------"
               end
            end
            if(flag == false)
                puts "--------------No Records Found Related Your Search-----------------"
            end

          when "3"
             puts"Enter the name of the course: "
             course = gets.chomp
                   puts "---------------------Printing Course Details--------------------"
                   puts "Course Name: "+course
                   puts "Colleges In Which This Course Exist Are: "
                   flag = false
                   CSV.read('courses.csv').each do |course1|
                         if(course1[0].include? course)
                              puts "College: "+course1[1]+" With Capacity: "+course1[2]
                              flag = true
                         end
                   end
                   if(flag == false)
                      puts "--------------No College Has Such Course -----------------"
                   end
          else
           puts"Invalid Choice......."

       end
  end

end
Management.manage

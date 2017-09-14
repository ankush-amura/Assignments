require_relative 'college'
require_relative 'student'
class Management

  def self.manage
    # loop to start with the main functionality
    while true do
      # call to display the complete menu for the user
      Management.menu
      choice = gets.chomp
    case choice
      # case 1 goes to add college function to add college to csv file
      when '1'
         Management.add_college
      # case 2 goes to add course function to add courses to the csv file
      when '2'
         Management.add_course
      # case 3 that goes to add student function to add student to csv file
      when '3'
         Management.add_student
      # case 4 that goes to the search window that furthur provides option for search
      when '4'
         Management.search
      # else case is responsible for handling the input of choice out of the asked
      else
           puts ' Invalid Choice.... '
      end
   end
end

# this method is responsible for the search functionality
# provides menu for search on college,course,student
#
def self.search
     choice = gets.chomp
     case choice
       # this case is transferring the system to the search college method
       when '1'
         Management.search_college
      # this case is responsible for transferring search to the search Student method
       when '2'
         Management.search_student
      # this case is responsible for transferring the search to the search course method
       when "3"
         Management.search_course
       else
         puts 'Invalid Choice.......'
       end
end

# displaying the menu that drives the system
#
def self.menu
 puts '---------------------------------- Management System ---------------------------------'
 puts '1.Add College To The Desk'
 puts '2.Add Course To The Desk'
 puts '3.Add Student To The Desk'
 puts '4.Search'
 puts '--------------------------------------------------------------------------------------'
 puts 'Enter Your Choice:'
end

# this method is responsile for driving the search functionality
#
def self.search_menu
  puts '----------------------------------- Search Desk ---------------------------------'
  puts '1. Search For College'
  puts '2. Search For Student'
  puts '3. Search For Course'
  puts '---------------------------------------------------------------------------------'
  puts 'Enter Your Choice: '
end


# method responsible for adding college to the system using college class method
# valiidates the name of the college as unique
#
def self.add_college
  flag=true
  while(flag == true )
    puts ' enter college name : '
    college_name = gets.chomp
    flag=false
    CSV.read(' colleges.csv ').each do |record|
       if(record[0]==college_name)
         puts 'The College Name AreadY Exists !!!!!! Please Reenter Details'
         flag = true
       end
    end
  end
  puts ' enter the contact: '
  contact =gets.chomp
  puts ' enter the number of courses available: '
  num_courses=gets.chomp
  College.create_college(college_name,contact,num_courses)
end


# method responsible for adding course in the system
# name of the course is validated as unique
#
def self.add_course
  flag=true
  while(flag == true )
    puts ' enter the course name: '
    course_name = gets.chomp
    puts ' enter the college name: '
    college_name = gets.chomp
    flag=false
    CSV.read('courses.csv').each do |record|
       if(record[0]==course_name and record[1]==college_name)
         puts ' The College Name With this course AreadY Exists !!!!!! Please Reenter Details '
         flag = true
       end
    end
  end
  puts  ' enter the capacity: '
  capacity =gets.chomp
  College.create_course(course_name,college_name,capacity)
end


# method responsible for adding student to the system
# the validation takes place as the sttudent name needs to be unique
#
def self.add_student
  flag=true
  while(flag == true )
    puts ' enter the student name: '
    student_name = gets.chomp
    flag=false
    CSV.read(' students.csv ').each do |record|
       if(record[0]==student_name)
         puts ' The Student With This Name AreadY Exists !!!!!! Please Reenter Details '
         flag = true
       end
    end
  end
  puts ' Enter Course Name:  '
  course_name = gets.chomp
  puts ' Enter College Name: '
  college_name = gets.chomp
  puts ' Enter Contact:      '
  contact = gets.chomp
  Student.create_student(student_name,course_name,college_name,contact)
end


# method rsponsible for search operation on college
# displays name and the capacity of all the courses under this college
#
def self.search_college
  puts 'enter the name of the college: '
  college = gets.chomp
  flag=false
  CSV.read('colleges.csv').each_with_index do |row,index|
    if( row[0].include? college )
       flag = true
       puts 'College Found At Record Number: #{index}'
       puts 'Fetching All Courses Provided By This College............'
       puts ' -----------------------Courses Available----------------------'
       CSV.read('courses.csv').each do |row|
           if(row[1].include? college)
             puts "course: "+row[0]
           end
       end
     end
  end
  if(flag== false)
     puts '--------------No Records Found Related Your Search-----------------'
  end
end

# method responsible for searching o the student in the system
# this method displays the name of the student
# college enrolled in and the course taken
#
def self.search_student
  puts 'Enter The Student Name: '
  student = gets.chomp
  flag=false;
  CSV.read(' students.csv ').each do |row|
     if(row[0].include? student)
        flag=true;
        puts ' ---------------------Printing Student Details--------------------'
        puts "Student Name: #{row[0]} "
        puts "Student Contact: #{row[1]}"
        puts "Student Course:  #{row[2]}"
        puts "student College Allocated: #{row[3]}"
        puts "-----------------------------------------------------------------"
      end
  end
  if(flag == false)
       puts '--------------No Records Found Related Your Search-----------------'
  end
end


# method responsible for search of the course in csv
# displays the course name and all the colleges it is available in
#
def self.search_course
  puts 'Enter the name of the course: '
  course = gets.chomp
      puts '---------------------Printing Course Details--------------------'
      puts "Course Name: #{course}"
      puts 'Colleges In Which This Course Exist Are: '
      flag = false
      CSV.read('courses.csv').each do |course1|
            if(course1[0].include? course)
                 puts "College: #{course1[1]}  With Capacity: #{course1[2]} "
                 flag = true
            end
      end
      if(flag == false)
         puts '--------------No College Has Such Course -----------------'
      end
end


end
Management.manage

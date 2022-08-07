def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  #create an empty array
  students = []
  #get the name
  name = gets.chomp
  puts "Enter cohort of the student"
  cohort = gets.chomp 
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the students array
    
    if !cohort.empty?
      students << {name: name, cohort: cohort.to_sym}
    else
      students << {name: name, cohort: :august}
    end
    
    puts "Now we have #{students.count} #{students.count == 1? "student": "students"}"
    
    #get another name from the user
    name = gets.chomp
    cohort = gets.chomp 
  end
  # return another name from the user
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
    
  if !students.empty?
    students_by_cohort = {}
  
    students.each do |student|
      cohort = student[:cohort]
    
      if students_by_cohort[cohort] == nil
        students_by_cohort[cohort] = []
      end
    
      students_by_cohort[cohort] << student[:name]
    end
  
    students_by_cohort.map do |student| 
      puts student
    end
  else
    puts "No students in the class."
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count == 1? "student": "students"}"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
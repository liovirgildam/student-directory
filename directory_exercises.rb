def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  #create an empty array
  students = []
  #get the name
  name = gets.chomp
  puts "Enter country of the student"
  country = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, country: country, cohort: :august}
    puts "Now we have #{students.count} student"
    #get another name from the user
    name = gets.chomp
    country = gets.chomp
  end
  # return another name from the user
  students
end

def print_header
  puts "The students of Villains Academy".center(45)
  puts "--------------------------------".center(45)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} - #{student[:country]} (#{student[:cohort]} cohort)".center(45)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(45)
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
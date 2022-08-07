def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  #create an empty array
  students = []
  #get the name
  name = gets.chomp
  puts "Enter country of the students"
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
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} - #{student[:country]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
# Let's put all students into an array
students =[
  ["Dr. Hannibal Lecter", :august],
  ["Darth Vader", :august],
  ["Nurse Ratched", :august],
  ["Michael Corleone", :august],
  ["Alex DeLarge", :august],
  ["The Wicked Witch of the West", :august],
  ["Terminator", :august],
  ["Freddy Krueger", :august],
  ["The Joker", :august],
  ["Joffrey Baratheon", :august],
  ["Norman Bates", :august]
]


def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
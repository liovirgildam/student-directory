@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #9 because we'll be adding more times
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def user_menu_choice(selection)
  case selection
    when "1"
      puts "Selected option 1- Add students"
      input_students
    when "2"
      puts "Selected option 2- show students in the class"
      show_students
    when "3"
      puts "Selected option 3- Save students to file"
      save_students
    when "4"
      puts "Selected option 4- Get students in the file"
      load_students
    when "9"
      puts "Selected option 9- Exit program"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    user_menu_choice(STDIN.gets.chomp)
  end
end

def save_students
  filename = STDIN.gets.chomp()
  #open the file for writing
  File.open(filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students 
  filename = STDIN.gets.chomp() # get filename from user
  if File.exist?(filename)
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_students_to_array(name, cohort = "august")
      end
    end
  else
    puts "File doesn't exist"
  end
  
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_students_to_array(name, cohort = "august")
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def add_students_to_array(name, cohort = "august")
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if !File.exist?(filename)# if it doesn't exist
    filename = "students.csv"
  end
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

#nothing happens until we call the methods

try_load_students
interactive_menu

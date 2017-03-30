def input_students
  puts "please enter the names of the student".center(150)
  #creating an empty array
  students = []
  #getting the first name
  name = gets.chomp
  #while the name is not empty; repeat this code
  puts "please enter the student's country of origin !".center(150)
  country = gets.chomp
while !name.empty? do
    #add the student hash to the array
    students << {name: name, country: country, cohort: :november}
    puts "Now we have #{students.count} students".center(150)
    puts "would you like to add another student? answer with yes or no".center(150)
    answer = gets.chomp
    if answer == "yes"
      puts "student name? Remember you can cancel by hitting enter twice !".center(150)
      name = gets.chomp
      puts "country of origin?".center(150)
      country = gets.chomp
    elsif answer == "no"
      break
     end
end
 students
end
 


def print_header
puts "The students of Villains academy".center(150)
puts "---------------------".center(150)  
end

def print(students)
students.each do |student|
  puts "#{student[:name]} from #{student[:country]} (#{student[:cohort]} cohort)".center(150)
end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students".center(150)
end

 students = input_students
  print_header
  print(students)
  print_footer(students)

def input_students
  puts "please enter the names of the student".center(150)
  #creating an empty array
  students = []
  #getting the first name
  name = gets.chomp
  #while the name is not empty; repeat this code
 
  
  while !name.empty? do
    #add the student hash to the array
     puts "please enter the student's country of origin !".center(150)
     country = gets.chomp
     puts "please input the students cohort".center(150)
     cohort = gets.chomp
     require 'date'
    if Date::MONTHNAMES.include?(cohort&&cohort.capitalize)
     cohort.to_sym
    else
     puts "that is an invalid date, we have automaticlly selected the nearest cohort available".center(150)
     cohort = :november
    end
    students << {name: name, country: country, cohort: cohort}
    puts "Now we have #{students.count} students".center(150)
    puts "would you like to add another student? answer with yes or no".center(150)
    answer = gets.chomp
    if answer == "yes"
    puts "what's the next students name?".center(150)
    name = gets.chomp
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
  cohort_list = students.group_by {|input| input[:cohort]}
  puts "Cohort list".center(150)
  cohort_list.map do |k, v|
  puts "#{k}".center(150)
  for index in 0..v.size-1 do
  puts "#{index+1}. #{v[index][:name]} from #{v[index][:country]}".center(150)
    end
  end
end


def print_footer(names)
puts "Overall, we have #{names.count} great students".center(150)
end

 students = input_students
  print_header
  print(students)
  print_footer(students)
  

@students = []

def interactive_menu
    loop do
    print_menu
    process(STDIN.gets.chomp)
end
end

def input_students
  puts "please enter the names of the student".center(150)
  #creating an empty array
  #getting the first name
  name = STDIN.gets.chomp
  #while the name is not empty; repeat this code
  while !name.empty? do
     @students = []
    #add the student hash to the array
     puts "please enter the student's country of origin !".center(150)
     country = STDIN.gets.chomp
     puts "please input the students cohort".center(150)
     cohort = STDIN.gets.chomp
     require 'date'
    if Date::MONTHNAMES.include?(cohort&&cohort.capitalize)
     cohort.to_sym
    else
     puts "that is an invalid date, we have automaticlly selected the nearest cohort available".center(150)
     cohort = :november
    end
   @students << {name: name, country: country, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students".center(150)
    puts "would you like to add another student? answer with yes or no".center(150)
    answer = STDIN.gets.chomp
    if answer == "yes"
    puts "what's the next students name?".center(150)
    name = STDIN.gets.chomp
    elsif answer == "no"
      break
    end
  end
end
 


def print_header
puts "The students of Villains academy".center(150)
puts "---------------------".center(150)  
end

def print_student_list
  cohort_list = @students.group_by {|input| input[:cohort]}
  puts "Cohort list".center(150)
  cohort_list.map do |k, v|
  puts "#{k}".center(150)
  for index in 0..v.size-1 do
  puts "#{index+1}. #{v[index][:name]} from #{v[index][:country]}".center(150)
    end
  end
end


def print_footer
puts "Overall, we have #{@students.count} great students".center(150)
end

def print_menu
   puts "1. Input the students"
   puts "2. Show the students"
   puts "3. Save the list to students.csv"
   puts "4. load the list ffrom students.csv"
   puts "9. Exit" 
end

def show_students
    print_header
    print_student_list
    print_footer
 end
 
def process(selection)
   case selection
    when "1"
       students = input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        load_students
    when "9"
        exit
    else
        puts "I dont know what you meant, try again"
    end
  end
  
def save_students
    #open the file for writing
    file = File.open("students.csv","w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open("students.csv","r")
    file.readlines.each do |line|
     name, country, cohort = line.chomp.split(",")
    @students << {name: name, country: country, cohort: cohort.to_sym}
  end
 file.close
end

def try_load_students
    filename = ARGV.first
    if filename.nil?
        load_students(filename = "students.csv")
        puts "loaded #{@students.count} from #{filename}"
    elsif File.exists?(filename)
        load_students(filename)
         puts "loaded #{@students.count} from #{filename}"
     else
         puts "sorry, #{filename} does not exist."
         exit
     end
 end
 
 
 try_load_students
 interactive_menu
 
  

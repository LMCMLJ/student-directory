#!/usr/bin/env ruby
#version 0.1
#created by Michael Calvey, Sept 2016

@students = []
def input_students
  puts "\n\n\n"
  puts "Please enter the following variables"
  puts "To finish, just hit enter twice"
  puts "\n\n\n"
  puts "Enter cohort of students (cohort will remain unchanged):"
  cohort = STDIN.gets.chomp
  if cohort == ''
    cohort = "september"
  end
  puts "\n"
  puts "Enter name:"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: cohort}
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have 1 student"
    end
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "______________"
end

def print_students
  if @students.count > 0
    @students.each.with_index(1) do |student, i|
      puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort)".center(80)
    end
  else
    puts "No registered students!"
  end
end

def print_by(selection)
  if selection == 1
    puts "Printing by cohort..."
    puts "Enter cohort to print by: "
    cohort = STDIN.gets.chomp
    @students.map.with_index(1) do |student, i|
      if student[:cohort] == cohort
        puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort)".center(80)
      end
    end
  elsif selection == 2
    puts "Printing by name length..."
    @students.map.with_index(1) do |student, i|
      if student[:name].length < 12
        puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort)".center(80)
      end
    end
  elsif selection == 3
    puts "Printing by first letter of name. Please enter letter to print by:"
    selected_letter = STDIN.gets.chomp
    @students.map.with_index(1) do |student, i|
      if student[:name].initial.downcase == selected_letter.downcase
        puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort)".center(80)
      end
    end
  else
    puts "Invalid selection, please try again."
  end
end


def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "\n\n"
  puts "1. Input students"
  puts "2. Print students- regular"
  puts "3. Print students by cohort"
  puts "4. Print students by name length"
  puts "5. Print students by first letter of name"
  puts "6. Save the file to students.csv"
  puts "7. Load students from students.csv"
  puts "9. Exit program"
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("filename", "w")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def process(choice)
  case choice
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    print_by(1)
  when "4"
    print_by(2)
  when "5"
    print_by(3)
  when "6"
    save_students
  when "7"
    load_students
  when "9"
    exit
  else
    puts "Invalid input, sorry"
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

interactive_menu

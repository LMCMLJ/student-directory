#!/usr/bin/env ruby
#version 0.1
#created by Michael Calvey, Sept 2016

def input_students
  puts "Please enter the following variables"
  puts "To finish, just hit enter twice"
  students = []
  puts "Enter cohort of students (cohort will remain unchanged):"
  @cohort = gets.chomp
  if @cohort == ''
    @cohort = "september"
  end
  puts "Enter name:"
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: @cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "______________"
end

def print(students)
  students.each.with_index(1) do |student, i|
    puts "#{i}: #{student[name]} (#{student[@cohort]} cohort)".center(80)
  end
end

def print_by(students, selection)
  students.map.with_index(1) do |student, i|
    students_to_print = []
    if selection == 1
      puts "Printing by cohort..."
      puts "Enter cohort to print by: "
      cohort = gets.chomp
      if student[cohort] == cohort
        puts "#{i}: #{student[name]} (#{student[@cohort]} cohort)".center(80)
      end
    elsif selection == 2
      puts "Printing by name length..."
      if student[name].length < 12
        puts "#{i}: #{student[name]} (#{student[@cohort]} cohort)".center(80)
      end
    elsif selection == 3
      puts "Printing by first letter of name. Please enter letter to print by:"
      selected_letter = gets.chomp
      if student[name].initial == selected_letter
        puts "#{i}: #{student[name]} (#{student[@cohort]} cohort)".center(80)
      end
    else
      puts "Invalid selection, please try again."
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

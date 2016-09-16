#!/usr/bin/env ruby
#version 0.1
#created by Michael Calvey, Sept 2016

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
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
  students.to_enum.with_index(1).each do |elem, i|
    puts "#{i}: #{students[name]} (#{students[cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

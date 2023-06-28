# Array to store employee hashes
require "tty-table"
employees = []

# how do I pull the info into the table because I don't have it until later in the code
# I'm thinking create a function that updates and displays table and call it after each change or read
table = TTY::Table.new(["First Name", "Last Name", "Salary", "Active"], [["#{employees[0][:first_name]}", "a2", "a3", "a4"], ["b1", "b2"]])
puts table.render(:ascii)

# get user input and make decision
quit = false
while !quit
  puts "Enter 'C' for create, 'R'for read, 'U' for update, 'D' for delete, 'Q' for quit."
  choice = gets.chomp.upcase
  # what happens when choice is C
  if choice == "C"
    employee = Hash.new
    puts "What is the first name of the employee you would like to add?"
    employee[:first_name] = gets.chomp
    puts "What is the employee's last name?"
    employee[:last_name] = gets.chomp
    puts "What is this person's salary?"
    employee[:salary] = gets.to_i
    puts "Are they still an active employee?"
    answer = gets.chomp
    if answer == "yes"
      employee[:active] = true
    elsif answer == "no"
      employee[:active] = false
    else
      puts "That is not a valid entry. Please enter 'yes' or 'no'."
      # Todo: insert loop to continue to ask until valid entry
    end
    # push to employees array
    employees << employee
    puts employees
    # what happens when choice is R
  elsif choice == "R"
    if employee
      puts "Employee first name: #{employee[:first_name]}; Employee last name: #{employee[:last_name]}; this employee makes #{employee[:salary]} dollars per year; this employee still works for the company: #{employee[:active]}"
    else
      puts "There are no employees to display."
    end
    # What happens when choice is U
  elsif choice == "U"
    if employee
      puts "What do you need to update? Enter 'FN' for first name, enter 'LN' for last name, enter 'S' for salary, and 'ES' for employment status."
      choice = gets.chomp.upcase
      case choice
      when "FN"
        puts "What's the new name?"
        employee[:first_name] = gets.chomp
      when "LN"
        puts "What's the new last name?"
        employee[:last_name] = gets.chomp
      when "S"
        puts "What is the new salary?"
        employee[:salary] = gets.to_i
      when "ES"
        puts "Are they still an active employee?"
        answer = gets.chomp
        if answer == "yes"
          employee[:active] = true
        elsif answer == "no"
          employee[:active] = false
        else
          puts "That is not a valid entry. Please enter 'yes' or 'no'."
        end
      else
        puts "That's not a valid option."
      end
    elsif !employee
      puts "There is no employee to update."
    else
      puts "That is not a valid option. Please enter 'FN', 'LN', 'S', or 'ES'."
    end
    # what happens when choice is D
  elsif choice == "D"
    employee = {}
  elsif choice == "Q"
    quit = true
  else
    puts "That is not a valid option. The program will now terminate."
    quit = true
  end
end

require_relative "challenge_methods"
require "json"
divider_len = 80

big_divider = "=" * divider_len
small_divider = "-" * divider_len

puts "Please enter a number corresponding to a challenge (1-7) for bonuses enter b1 or b2, press x to quit.."
while true
    title = ""
    data = []
    choice = gets.chomp
    system "clear" or system "cls"
    case choice
        when "1"
            title = "The 3 most commonly used languages with total number of parents: "
            data = Challenge_Methods.challenge_one
        when "2"
            title = "List of students with no cell phone number:"
            data = Challenge_Methods.challenge_two
        when "3"
            title = "List of students who are enrolled in Physics 9."
            data = Challenge_Methods.challenge_three
        when "4"
            title = "List of students with no parents listed or no contact info."
            data = Challenge_Methods.challenge_four
                .map{|student| {student_id: student["student_id"], first_name: student["FirstName"], last_name: student["LastName"]}}
        when "5"
            title =  "List of sections with no students enrolled."
            data = Challenge_Methods.challenge_five
        when "6"
            title =  "List of sections and students in each section."
            data = Challenge_Methods.challenge_six
        when "7"
            title = "List of staff members attached to a section."
            data = Challenge_Methods.challenge_seven
        when "b1"
            title = "Language mapping for language codes found in parents.csv"
            Challenge_Methods.challenge_bonus_one.each do |lang, code|
                data << "#{lang}: #{code}"
            end
        when "b2"
            title = "Phone numbers which appear in two or more files:"
            Challenge_Methods.challenge_bonus_two.each do |num, files|
                if files.count > 1
                    data << {phone_number: num, files:files}
                end
            end
        when "x", "X"
            break
        else 
            puts "Error: You seem to have typed an invalid choice. Please enter a number inluding 1-7 or enter b1 or b2 for bonuses"
            next
    end

    puts big_divider
    puts "Challenge #{choice}: #{title}"
    puts JSON.pretty_generate(data)
    puts big_divider

    puts "Make another choice (1-7, b1, b2) or press x to quit..."
end
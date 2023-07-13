require_relative "challenge_methods"

divider_len = 80

big_divider = "=" * divider_len
# small_divider = "-" * divider_len

puts "Please enter a number corresponding to a challenge (1-7) for bonuses enter b1 or b2, press x to quit.."
while true
    title = ""
    data = []
    choice = gets.chomp
    system "clear" or system "cls"
    case choice
        when "1"
            title = "The 3 most commonly used languages with respective number of parents: "
            Challenge_Methods.challenge_one.each do |language, count|
                data << "#{language}: #{count}"
            end
        when "2"
            title = "List of students with no cell phone number:"
            Challenge_Methods.challenge_two.each do |student|
                data << "student_id: #{student[:student_id]}, first_name: #{student[:FirstName]}, last_name: #{student[:LastName]}"
            end
        when "3"
            title = "List of students who are enrolled in Physics 9."
            Challenge_Methods.challenge_three.each do |student|
                data << "student_id: #{student[:student_id]}, first_name: #{student[:FirstName]}, last_name: #{student[:LastName]}"
            end
        when "4"
            title = "List of students with no parents listed or no contact info."
            Challenge_Methods.challenge_four.each do |student|
                data << "student_id: #{student["student_id"]}, first_name: #{student["FirstName"]}, last_name: #{student["LastName"]}"
            end
        when "5"
            #TODO: really check this and verify that it is accurate. If so, go back and redo all functions with checks to see if the return is empty, if so output a standard message.
            title =  "List of sections with no students enrolled."
            Challenge_Methods.challenge_five.each do |section|
                data << "section_id: #{section["section_id"]} course_name: #{section["course_name"]}"
            end
        when "6"
            title =  "List of sections and students in each section."
            Challenge_Methods.challenge_six.each do |section|
                data << "section_id: #{section[:section_id]} course_name: #{section[:course_name]}\nstudent_ids: #{section[:student_ids]}"
            end
        when "7"
            title = "List of staff members attached to a section."
            Challenge_Methods.challenge_seven.each do |staff_member|
                data << "staff_id: #{staff_member[:staff_id]} first_name: #{staff_member[:first_name]} last_name: #{staff_member[:last_name]}"
            end
        when "b1"
            title = "Language mapping for language codes found in parents.csv"
            Challenge_Methods.challenge_bonus_one.each do |lang, code|
                data << "#{lang}: #{code}"
            end
        when "b2"
            title = "Phone numbers which appear in two or more files:"
            Challenge_Methods.challenge_bonus_two.each do |num, files|
                if files.count > 1
                    data << "Phone Number: #{num} Files: #{files}"
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
    puts data
    puts big_divider

    puts "Make another choice (1-7, b1, b2) or press x to quit..."
end
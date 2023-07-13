require 'pp'

big_divider = "=" * 40
small_divider = "-" * 40

def parse_csv_to_list_of_hashes(input)
    column_names=[]
    csv_to_array =[]
    File.open(input, "r") do |file|
        file.each_line do |line|
            vals = line.chomp().split(",")
            if $. == 1
                column_names = vals;
                next
            end
            csv_to_array << Hash[column_names.zip(vals)]
        end
    end
    return csv_to_array
end

# def challenge_one()
#     parent_hash_arr = parse_csv_to_list_of_hashes("./data/parents.csv")
#     common_lang = Hash[]

#     parent_hash_arr.each do |parent|
#         if not common_lang.key?(parent["language"])
#             common_lang[parent["language"]]=1;
#         else
#             common_lang[parent["language"]]+=1;
#         end
#     end
#    return common_lang.sort_by {|k, v| -v}.first(3)
# end

def challenge_one()
    parent_hash_arr = parse_csv_to_list_of_hashes("./data/parents.csv")
    # This defaults any key to 0 if it doesn't exist, which allows me to skip the if statement and increment it.
    common_lang = Hash.new(0) 

    parent_hash_arr.each do |parent|
        common_lang[parent["language"]] += 1
    end
    return common_lang.sort_by {|k, v| -v}.first(3)
end

def challenge_two()
    return parse_csv_to_list_of_hashes("./data/students.csv")
        .select {|student| student["cellphone"]==nil}
        .map { |student| {FirstName: student["FirstName"], LastName: student["LastName"], student_id: student["student_id"]} }
end

def challenge_three()
    physics_9_section_ids = parse_csv_to_list_of_hashes("./data/sections.csv")
        .select {|section| section["course_name"]=="Physics 9"}
        .map {|section| section["section_id"]}
    physics_9_rosters = parse_csv_to_list_of_hashes("./data/rosters.csv")
        .select {|roster| physics_9_section_ids.include?(roster["section_id"])}
        .map {|roster| roster["student_id"]}
    return students_enrolled_physics_9 = parse_csv_to_list_of_hashes("./data/students.csv")
        .select {|student| physics_9_rosters.include?(student["student_id"])}
        .map {|student| {student_id: student["student_id"], FirstName: student["FirstName"], LastName:student["LastName"]}}
end

#TODO: read the csv files just once.
def challenge_four()
    parents_student_ids = parse_csv_to_list_of_hashes("./data/parents.csv")
        .map {|parent| parent["student_id"]}

    students = parse_csv_to_list_of_hashes("./data/students.csv")
        .select {|student| !parents_student_ids.include?(student["student_id"])}
    
    parents_student_ids = parse_csv_to_list_of_hashes("./data/parents.csv")
        .select {|parent| (parent["email"].nil? || parent["email"].empty?) && (parent["mobile"].nil? || parent["mobile"].empty?)}
        .map {|parent| parent["student_id"]}

    return students.concat(
        parse_csv_to_list_of_hashes("./data/students.csv")
            .select {|student| parents_student_ids.include?(student["student_id"])}
    )
end

def challenge_five()
    rosters = parse_csv_to_list_of_hashes("./data/rosters.csv")
    sections = parse_csv_to_list_of_hashes("./data/sections.csv")

    roster_section_ids = rosters.map {|roster| roster["section_id"]}

    sections_no_students = sections
        .select {|section| !roster_section_ids.include?(section["section_id"])}

    return sections_no_students
end


# TODO: rewrite this to be more understandable
def challenge_six()
    rosters = parse_csv_to_list_of_hashes("./data/rosters.csv")
    sections = parse_csv_to_list_of_hashes("./data/sections.csv")

    roster_hash = Hash.new {|hash, key| hash[key] = []}
    rosters.each do |roster|
        roster_hash[roster["section_id"]] << roster["student_id"]
    end

    sections_with_students = sections.map do |section|
        { section_id: section["section_id"], 
          course_name: section["course_name"], 
          student_ids: roster_hash[section["section_id"].to_s] || [] }
    end
    return sections_with_students
end

def challenge_seven()
    sections = parse_csv_to_list_of_hashes("./data/sections.csv")
        .map {|section| section["staff_id"]}

    return parse_csv_to_list_of_hashes("./data/staff.csv")
        .select {|staff_member| sections.include?(staff_member["staff_id"])}
        .map {|staff_member| {staff_id: staff_member["staff_id"], first_name: staff_member["first_name"], last_name: staff_member["last_name"]}}
end

puts "Please enter a number corresponding to a challenges 1-7 or b1/b2 for bonuses, press x to quit.."
while 1
    choice = gets.chomp
    case choice
        when "1"
            puts big_divider
            puts "Challenge 1: The 3 most commonly used languages with respective number of parents: "
            puts small_divider
            challenge_one.each do |language, count|
                puts "#{language}: #{count}"
            end
            puts big_divider
        when "2"
            puts big_divider
            puts "Challenge 2: List of students with no cell phone number:"
            puts small_divider
            challenge_two.each do |student|
                puts "student_id: #{student[:student_id]}, first_name: #{student[:FirstName]}, last_name: #{student[:LastName]}"
            end
            puts big_divider
        when "3"
            puts big_divider
            puts "Challenge 3: List of students who are enrolled in Physics 9."
            puts small_divider
            challenge_three.each do |student|
                puts "student_id: #{student[:student_id]}, first_name: #{student[:FirstName]}, last_name: #{student[:LastName]}"
            end
            puts big_divider
        when "4"
            puts big_divider
            puts "Challenge 4: List of students with no parents listed or no contact info."
            puts small_divider
            challenge_four.each do |student|
                puts "student_id: #{student["student_id"]}, first_name: #{student["FirstName"]}, last_name: #{student["LastName"]}"
            end
            puts big_divider
        when "5"
            #TODO: really check this and verify that it is accurate. If so, go back and redo all functions with checks to see if the return is empty, if so output a standard message.
            puts big_divider
            puts "Challenge 5: List of sections with no students enrolled."
            puts small_divider
            challenge_five.each do |section|
                puts "section_id: #{section["section_id"]} course_name: #{section["course_name"]}"
            end
            puts big_divider
        when "6"
            puts big_divider
            puts "Challenge 6: List of sections and students in each section."
            puts small_divider
            challenge_six.each do |section|
                puts "section_id: #{section[:section_id]} course_name: #{section[:course_name]}"
                puts "student_ids: #{section[:student_ids]}"
            end
            puts big_divider
        when "7"
            puts big_divider
            puts "Challenge 7: List of staff members attached to a section."
            puts small_divider
            challenge_seven.each do |staff_member|
                puts "staff_id: #{staff_member[:staff_id]} first_name: #{staff_member[:first_name]} last_name: #{staff_member[:last_name]}"
            end
            puts big_divider
        when "x"
            is_playing = false;
            break
        else 
            puts "Error: You seem to have typed an invalid choice. Please enter a number inluding 1-7 or enter b1 or b2 for bonuses"
            next
    end
    puts "Make another choice or press x to quit..."
end
















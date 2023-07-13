require_relative "csv_handler"

module Challenge_Methods

    def self.challenge_one()
        parent_hash_arr = CSV_Handler.parse_csv_to_list_of_hashes("./data/parents.csv")
        common_lang = Hash.new(0) 

        parent_hash_arr.each do |parent|
            common_lang[parent["language"]] += 1
        end
        return common_lang.sort_by {|k, v| -v}.first(3)
    end

    def self.challenge_two()
        return CSV_Handler.parse_csv_to_list_of_hashes("./data/students.csv")
            .select {|student| student["cellphone"]==nil}
            .map { |student| {FirstName: student["FirstName"], LastName: student["LastName"], student_id: student["student_id"]} }
    end

    def self.challenge_three()
        physics_9_section_ids = CSV_Handler.parse_csv_to_list_of_hashes("./data/sections.csv")
            .select {|section| section["course_name"]=="Physics 9"}
            .map {|section| section["section_id"]}
        physics_9_rosters = CSV_Handler.parse_csv_to_list_of_hashes("./data/rosters.csv")
            .select {|roster| physics_9_section_ids.include?(roster["section_id"])}
            .map {|roster| roster["student_id"]}
        return students_enrolled_physics_9 = CSV_Handler.parse_csv_to_list_of_hashes("./data/students.csv")
            .select {|student| physics_9_rosters.include?(student["student_id"])}
            .map {|student| {student_id: student["student_id"], FirstName: student["FirstName"], LastName:student["LastName"]}}
    end

    def self.challenge_four()
        parents = CSV_Handler.parse_csv_to_list_of_hashes("./data/parents.csv")
        students = CSV_Handler.parse_csv_to_list_of_hashes("./data/students.csv")

        parents_student_ids = parents
            .map {|parent| parent["student_id"]}

        students_missing_parents = students
            .select {|student| !parents_student_ids.include?(student["student_id"])}
        
        parents_student_ids_no_info = parents
            .select {|parent| (parent["email"].nil? || parent["email"].empty?) && (parent["mobile"].nil? || parent["mobile"].empty?)}
            .map {|parent| parent["student_id"]}

        return students_missing_parents.concat(
            students.select {|student| parents_student_ids_no_info.include?(student["student_id"])}
        )
    end

    def self.challenge_five()
        rosters = CSV_Handler.parse_csv_to_list_of_hashes("./data/rosters.csv")
        sections = CSV_Handler.parse_csv_to_list_of_hashes("./data/sections.csv")

        roster_section_ids = rosters.map {|roster| roster["section_id"]}

        sections_no_students = sections
            .select {|section| !roster_section_ids.include?(section["section_id"])}

        return sections_no_students
    end

    def self.challenge_six()
        rosters = CSV_Handler.parse_csv_to_list_of_hashes("./data/rosters.csv")
        sections = CSV_Handler.parse_csv_to_list_of_hashes("./data/sections.csv")

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

    def self.challenge_seven()
        sections = CSV_Handler.parse_csv_to_list_of_hashes("./data/sections.csv")
            .map {|section| section["staff_id"]}

        return CSV_Handler.parse_csv_to_list_of_hashes("./data/staff.csv")
            .select {|staff_member| sections.include?(staff_member["staff_id"])}
            .map {|staff_member| {staff_id: staff_member["staff_id"], first_name: staff_member["first_name"], last_name: staff_member["last_name"]}}
    end

    def self.challenge_bonus_one()
        codes = CSV_Handler.parse_csv_to_list_of_hashes("./data/language_codes.csv")
        parents = CSV_Handler.parse_csv_to_list_of_hashes("./data/parents.csv")

        parent_langs = parents.map {|parent| parent["language"]}.uniq

        languages_with_codes = []

        parent_langs.each do |lang|
            if !lang || lang.empty?
                next
            end
                one_code = codes.find {|code| code["language"] == lang}
            if one_code
                languages_with_codes << [lang, one_code["alpha2"]]
            end
        end
        return languages_with_codes
    end

    def self.challenge_bonus_two()
        students = CSV_Handler.parse_csv_to_list_of_hashes("./data/students.csv")
        parents = CSV_Handler.parse_csv_to_list_of_hashes("./data/parents.csv")
        staff = CSV_Handler.parse_csv_to_list_of_hashes("./data/staff.csv")
    
        common_num = Hash.new { |h, k| h[k] = [] }
    
        students.each do |student|
            if !(student["cellphone"].nil? || student["cellphone"].empty?)
                if !common_num[student["cellphone"]].include? "students.csv"
                    common_num[student["cellphone"]] << "students.csv"
                end
            end
        end
    
        parents.each do |parent|
            if !(parent["mobile"].nil? || parent["mobile"].empty?)
                if !common_num[parent["mobile"]].include? "parents.csv"
                    common_num[parent["mobile"]] << "parents.csv" 
                end
            end
        end
    
        staff.each do |staff|
            if !(staff["mobile"].nil? || staff["mobile"].empty?)
                if !common_num[staff["mobile"]].include? "staff.csv"
                    common_num[staff["mobile"]] << "staff.csv" 
                end
            end
        end

        return common_num
    end
end
module CSV_Handler
    def self.parse_csv_to_list_of_hashes(input)
        column_names = []
        csv_to_array = []
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
end
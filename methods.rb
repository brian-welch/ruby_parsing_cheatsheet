def headers?(answer)
  answer.downcase.strip.to_s =~ /[(y|j|^1)]/ ? true : false
end

def special_char(answer)
  if answer.downcase.strip.to_s =~ /[^A-Za-z0-9]/
    answer.downcase.lstrip.to_s
  else
    'invalid delimiter'
  end
end

def inputs(args = {})
  puts "  |          Headers: #{args[:headers]}\n" \
       "  |        Delimiter: #{args[:delimiter]}\n" \
       "  |  Quote Character: #{args[:quotes]}\n" \
       "  |        File Path: #{args[:file_path]}\n\n"
end

def csv_code(option, file_path)
  if option == "1"
    puts "master_array = CSV.read(#{file_path})"
  else
    puts "CSV.foreach(#{file_path}, csv_options) do |row|
  # code to run on each line
  # eg. puts \#{row[0]}, a \#{row[1]} beer from \#{row[2]}
  [ . . . ]
end"

  end
end

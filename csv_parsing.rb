require_relative       'header'
require_relative       'methods'
header

inputs()

puts "Does your CSV file have headers in the first row?
- - - - - - - - - - - - - - - - - - - - - - - - -"
print '> '
resp = gets.chomp.downcase
while (resp =~ /[(y|j|^1|n|^0)]/).nil?
  puts "(Doesn't appear to be a 'yes' or 'no')"
  print '> '
  resp = gets.chomp.downcase
end
headers = headers?(resp)

header
inputs(headers: headers)

puts "What is the column delimiter of your CSV?
- - - - - - - - - - - - - - - - - - - - -"
print '> '
resp = gets.chomp
p resp =~ /[^A-Za-z0-9]/
while (resp =~ /[^A-Za-z0-9]/).nil?
  puts "(Invalid delimiter; maybe ';' or ','?)"
  print '> '
  resp = gets.chomp
end
delimiter = special_char(resp)

header
inputs(headers: headers, delimiter: delimiter)

puts "What is the quote character of your CSV?
- - - - - - - - - - - - - - - - - - - - -"
print '> '
resp = gets.chomp
while (resp =~ /[^A-Za-z0-9]/).nil?
  puts '(Invalid delimiter; should not be a regular alpha-numeric.)'
  print '> '
  resp = gets.chomp
end
quotes = special_char(resp)

header
inputs(headers: headers, delimiter: delimiter, quotes: quotes)

puts "What is the file path of your CSV file?
- - - - - - - - - - - - - - - - - - - - -"
print '> '
file_path = gets.chomp.strip

header
inputs(headers: headers, delimiter: delimiter, quotes: quotes, file_path: file_path)

puts "Do you want to:

    [1] - Get a master array with each row as a sub array?
    [2] - Enumerate through each row of your csv file?
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
print '> '
resp = gets.chomp.downcase

while (resp =~ /[(1|2)]/).nil?
  puts "(Doesn't appear to be a '1' or '2')"
  print '> '
  resp = gets.chomp
end

header
inputs(headers: headers, delimiter: delimiter, quotes: quotes, file_path: file_path)

puts "Here is your cheatsheet code:
=============================\n\n"

puts "#>~ top line\nrequire 'csv'\n\n"

puts "#>~ csv options"
puts "csv_options = {col_sep: '#{delimiter}', quote_char: '#{quotes}'" \
     " #{headers ? ', headers: :first_row' : ''}}\n\n"

puts "#>~ file path variable\nfilepath = '#{file_path}'\n\n"

puts "#>~ csv parser"

csv_code(resp, file_path)

puts "
#>~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ~<#
#>~ For more info: https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html ~<#
#>~ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ~<#"

# CSV.foreach(filepath, csv_options) do |row|
#   puts "#{row['Name']}, a #{row['Appearance']} beer from #{row['Origin']}"
# end

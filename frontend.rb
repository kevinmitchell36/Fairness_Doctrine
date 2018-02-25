require 'unirest'
require 'pp'

puts 'Please select from the following menu:'
puts '[1] See all publications'

user_input = gets.chomp
if user_input == '1'
  response = Unirest.get("http://localhost:3000/v1")
  publication = response.body
  pp publication
end
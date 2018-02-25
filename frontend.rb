require 'unirest'
require 'pp'
base_url = "http://localhost:3000"

puts 'Please select from the following menu:'
puts '[1] See all publications'
puts '[2] Add a publication'
puts '[3] See one publication'

user_input = gets.chomp
if user_input == '1'
  response = Unirest.get("http://localhost:3000/v1")
  publication = response.body
  pp publication
elsif user_input == '2'
  params = {}
  print 'Enter a name:'
  params[:name] = gets.chomp
  print 'Enter lean:'
  params[:lean] = gets.chomp
  response = Unirest.post("#{base_url}/v1/publications", parameters: params)
  publication = response.body
  pp publication
elsif user_input == '3'
  print 'Enter a publication id:'
  publication_id = gets.chomp
  response = Unirest.get("#{base_url}/v1/publications/#{publication_id}")
  publication = response.body
  pp publication
end
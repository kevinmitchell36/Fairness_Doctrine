require 'unirest'
require 'pp'
base_url = "http://localhost:3000"

puts 'Please select from the following menu:'
puts '[1] See all publications'
puts '[2] Add a publication'
puts '[3] See one publication'
puts '[4] Edit a publication'
puts '[5] Delete a publication'

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
elsif user_input == '4'
  print 'Enter a publication id:'
  publication_id = gets.chomp
  response = Unirest.get("#{base_url}/v1/publications/#{publication_id}")
  publication = response.body
  pp publication
  params = {}
  puts "Enter a name (#{publication["name"]}):"
  params[:name] = gets.chomp
  puts "Enter a lean (#{publication["lean"]}):"
  params[:lean] = gets.chomp
  params.delete_if { |key, value| value.empty? }
  response = Unirest.patch("#{base_url}/v1/publications/#{publication_id}", parameters: params)
  publication = response.body
  pp publication
elsif user_input == '5'
  puts "Enter a publication id:"
  publication_id = gets.chomp
  response = Unirest.delete("#{base_url}/v1/publications/#{publication_id}")
  pp response.body
end 
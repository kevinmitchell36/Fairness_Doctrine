require 'unirest'
require 'pp'
base_url = "http://localhost:3000"

while true
  system 'clear'
  puts 'Please select from the following menu:'
  puts '[1] See all publications'
  puts '[2] Add a publication'
  puts '[3] See one publication'
  puts '[4] Edit a publication'
  puts '[5] Delete a publication'
  puts '[6] Signup'
  puts '[7] Login'
  puts '[8] Logout'
  puts '[q] Quit'

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
    params.delete_if { |_, value| value.empty? }
    response = Unirest.patch("#{base_url}/v1/publications/#{publication_id}", parameters: params)
    publication = response.body
    pp publication
  elsif user_input == '5'
    puts "Enter a publication id:"
    publication_id = gets.chomp
    response = Unirest.delete("#{base_url}/v1/publications/#{publication_id}")
    pp response.body
  elsif user_input == '6'
    params = {}
    puts 'Enter your name:'
    params[:name] = gets.chomp
    puts 'Enter your email:'
    params[:email] = gets.chomp
    puts 'Enter your password:'
    params[:password] = gets.chomp
    puts 'Confirm your password'
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("#{base_url}/v1/users", parameters: params)
    pp response.body
  elsif user_input == '7'
    puts 'Please login'
    params = {}
    puts "Email:"
    params[:email] = gets.chomp
    puts 'Password:'
    params[:password] = gets.chomp
    response = Unirest.post("#{base_url}/v1/user_token", parameters: {auth: {email: params[:email], password: params[:password]}})
    pp response.body
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  elsif user_input == '8'
    jwt = ""
    Unirest.clear_default_headers()
  elsif user_input == 'q'
    puts 'Goodbye'
    break
  end 
  puts
  puts "Press enter to continue"
  gets.chomp
end
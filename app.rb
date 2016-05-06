require 'sinatra'
require 'csv'
require 'json'

# write each row of data to json file
# file = File.open('businesses.json', 'w')
# businesses = CSV.open('engineering_project_businesses.csv', :headers => true)
# businesses.each do |row|
# 	file.write(row.to_hash.to_json)
# 	file.write("\n")
# end
# file.close

# get '/businesses' do

# end

# get '/businesses/:id' do

# end

# open("http://google.com") do |f|
# 	puts f.base_uri
# 	puts f.status
# end
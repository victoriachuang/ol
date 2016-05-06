# require 'sinatra'
require 'csv'
require 'json'

# get '/' do
# 	'Hello world'
# end

# get '/businesses/:id' do

# end

file = File.open('businesses.json', 'w')

businesses = CSV.open('engineering_project_businesses.csv', :headers => true)

businesses.each do |row|
	file.write(row.to_hash.to_json)
	file.write("\n")
end

file.close

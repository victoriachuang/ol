# require 'rubygems'
# require 'sinatra'
require 'csv'
# require 'json'
# require 'data_mapper'
# require 'sqlite'

# DataMapper.setup(:default, 'sqlite::memory:')

class Business

	attr_reader :id, :uuid, :name, :address, :address2, :city, :state, :zip, :country, :phone, :website, :created_at

	def initialize(id, uuid, name, address, address2, city, state, zip, country, phone, website, created_at)
		@id = id
		@uuid = uuid
		@name = name
		@address = address
		@address2 = address2
		@city = city
		@state = state
		@zip = zip
		@country = country
		@phone = phone
		@website = website
		@created_at = created_at
	end
end

businesses = CSV.read("./test.csv")

businesses.each do |property|
	hello = Business.new(property[0], property[1], property[2], property[3], property[4], property[5], property[6], property[7], property[8], property[9], property[10], property[11])
  # p hello
end

# CSV.read("test.csv") do |row|
# 	data = row.split(',')
#   
# end

# get '/businesses' do

# end

# get '/businesses/:id' do

# end
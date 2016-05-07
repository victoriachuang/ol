require 'sinatra'
require 'csv'
require 'json'

class Business

	# read each attribute
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

	# custom to_json method for created class
	def to_json(*a)
		{'id' => @id,
			'uuid' => @uuid,
			'name' => @name,
			'address' => @address,
			'address2' => @address2,
			'city' => @city,
			'state' => @state,
			'zip' => @zip,
			'country' => @country,
			'phone' => @phone,
			'website' => @website,
			'created_at' => @created_at
		}.to_json(*a)
	end

		# def self.all
  #   	ObjectSpace.each_object(self).to_a
  # 	end


	# def find_by_id
	# 	$all_businesses.
	# end
end

businesses = CSV.read("./engineering_project_businesses.csv")
$all_businesses = []

# remove header row of CSV
businesses.shift

# create Business object from each line of CSV
businesses.each do |property|
	$all_businesses << Business.new(property[0], property[1], property[2], property[3], property[4], property[5], property[6], property[7], property[8], property[9], property[10], property[11])
end

get '/businesses?:page' do

	print_businesses = $all_businesses.slice(0, 50)
	print_businesses.to_json
end

# get '/businesses/:id' do
# 	b = Business.find(1)
# 	JSON.pretty_generate(b.to_json)
# end
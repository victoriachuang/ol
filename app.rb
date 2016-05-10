require 'csv'
require 'json'
require 'sinatra'
require 'uri'

BUSINESSES_PER_PAGE = 50

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

end

businesses = CSV.read("./engineering_project_businesses.csv")
$all_businesses = []

# remove header row of CSV
businesses.shift

# create Business object from each line of CSV
businesses.each do |property|
	$all_businesses << Business.new(property[0], property[1], property[2], property[3], property[4], property[5], property[6], property[7], property[8], property[9], property[10], property[11])
end

get '/businesses' do
	page = params[:page].to_i

	# if there is no page parameter, set to page 1
	if (page == 0)
		page = 1

	# raise 404 if invalid page range requested
	elsif (page < 0 || page > ($all_businesses.size / BUSINESSES_PER_PAGE))
		status 404
	end

	display_businesses = $all_businesses.slice((page - 1) * BUSINESSES_PER_PAGE, BUSINESSES_PER_PAGE)
	display_businesses.to_json
end

get '/businesses/:id' do
	id = URI(uri).path.split('/').last.to_i
	display_business = $all_businesses[id]
	display_business.to_json
end
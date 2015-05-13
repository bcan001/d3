class City
	attr_accessor :name,:state,:country,:longitude,:latitude
	def initialize
		@name = ''
		@state = ''
		@longitude = 0
		@latitude = 0
	end
end

# 1. parse the data into ruby data structure
# 2. write the data structure into a csv file

cities_file = 'cities.txt'
file = File.open(cities_file, 'r')
all_cities = []
	
file.each.with_index(1) do |line, index|
	#puts line
	@city = City.new

	# put the city data into an array,split by the commas
	array = line.split(",")
	# puts array[1]

	@city.name = array[1][10..-1]
	@city.state = array[2]
	
	if array[4][8..-1] == nil
		@city.latitude = ' '
	else
		@city.latitude = array[4][8..-1]
	end
	
	if array[5][0..-4] == nil 
		@city.longitude = ' '
	else
		@city.longitude = array[5][0..-4]
	end

	city_array = []
	city_array << @city.name
	city_array << @city.state[-2..-1]
	city_array << @city.latitude.to_f
	city_array << @city.longitude.to_f

	all_cities << city_array

end

p all_cities


header = "name,state,latitude,longitude"
write_file = "allcities.csv"
File.open(write_file, "w") do |csv|
  csv << header
  csv << "\n"
  all_cities.each do |c|
    csv << c[0]
    csv << ","    
    csv << c[1]
    csv << ","   
    csv << c[2] 
    csv << ","     
    csv << c[3]  
    csv << "\n"
 end
end





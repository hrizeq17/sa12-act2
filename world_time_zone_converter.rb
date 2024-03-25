require 'httparty'
area = "Europe"
location = "London"
url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
response = HTTParty.get(url)
time_data = JSON.parse(response.body)

current_time = Time.parse(time_data["datetime"]).strftime("%Y-%m-%d %H:%M:%S")

puts "The current time in #{area}/#{location} is #{current_time}"
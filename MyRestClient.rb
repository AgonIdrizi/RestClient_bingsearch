require 'rest-client'

class MyRestClient
	attr_reader :response


  def initialize
 	@response = ""
  end

  def bing_search(param)
  	begin
  	 @response =  RestClient.get "https://www.bing.com/search", {:params => {:q => param}}
  	rescue RestClient::ResourceNotFound => err
  		puts "Response code: #{err.message}"
  	end
  end

  def print_response
  	puts ""
  	puts "Response code: #{@response.code}"
  	puts ""
  	puts "Response headers: #{@response.headers}"
  	puts ""
  	puts "Response cookies: #{@response.cookies}"
  	puts ""
  	puts "Response body: #{@response.body}"
  end
 
end

rest_client = MyRestClient.new

rest_client.bing_search("agon")
rest_client.print_response





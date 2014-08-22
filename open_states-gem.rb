require 'net/http'
require 'json'

class OpenStates
	
		def initialize
			@uri = "http://openstates.org/api/v1//"
			@key = "apikey=65773587715a49ab90960ff88a098c56"
		end

		def get_states_info(info_type, state_abbr = nil, add_info = nil)
			case info_type
			when 'metadata'
				if state_abbr == nil
					result = Net::HTTP.get(URI(@uri + "#{info_type}/?#{@key}"))
				else
					result = Net::HTTP.get(URI(@uri + "#{info_type}/#{state_abbr}/?#{@key}"))
				end	

				states_meta = JSON.parse(result)
				
				if add_info == nil
					states_meta
				else
					states_meta[add_info]
				end

			when 'bills'
				bills_uri = @uri + "#{info_type}/?state=#{state_abbr}&"
				if add_info == nil
					result = Net::HTTP.get(URI(bills_uri + @key))
				else	
					result = Net::HTTP.get(URI(bills_uri + "q=#{add_info}&" + @key))
				end
				JSON.parse(result)

			when 'legislators'
				if add_info == nil
					result = Net::HTTP.get(URI(@uri + "legislators/?state=#{state_abbr}&active=true&" + @key))
				else
					result = Net::HTTP.get(URI(@uri + "legislators/#{add_info}/?state=#{state_abbr}&active=true&" + @key))
				end
				JSON.parse(result)

			when 'events'
				result = Net::HTTP.get(URI(@uri + "#{info_type}/?state=#{state_abbr}&format=json&" + @key))
				JSON.parse(result)	
			end	
		end











		# def get_state_metadata(state_abbr, add_info = nil)
		# 	if  add_info == nil
		# 		result = Net::HTTP.get(@uri + "metadata/#{state_abbr}/?#{@key}")
		# 		JSON.parse(result)
		# 	else 
		# 		result = Net::HTTP.get(@uri + "metadata/#{state_abbr}/?apikey=65773587715a49ab90960ff88a098c56")
		# 		state_meta = JSON.parse(result)
		# 		state_meta[add_info]
		# 	end
		# end

		# ### SEARCH BY PARAMETER LIKE STATE ###
		# ### FILTER BY STRING - EXAMPLE: BILLS REGARDING CARS ###
		# def bill_search(state_abbr, add_info)
		# 	result = Net::HTTP.get(@uri + "/bills/?state=#{state_abbr}&q=#{addinfo}&apikey=65773587715a49ab90960ff88a098c56")
		# 	bills = JSON.parse(result)
		# 	return bills
		# end


		# ### Can get info like full_name ###
		# ### addinfo can be specific id ###
		# def legislator_search(state, addinfo = nil)
		# 	if addinfo == nil
		# 		uri = URI("http://openstates.org/api/v1//legislators/?state=#{state}&active=true&apikey=65773587715a49ab90960ff88a098c56")
		# 		result = Net::HTTP.get(uri)
		# 		JSON.parse(result)
		# 	else
		# 		uri = URI("http://openstates.org/api/v1//legislators/#{addinfo}/?state=#{state}&active=true&apikey=65773587715a49ab90960ff88a098c56")
		# 		result = Net::HTTP.get(uri)
		# 		JSON.parse(result)	
		# 	end	
		# end

		# ### Find out about events in your state ###
		# ### pass state param ###
		# def event_search(state)
		# 	uri = URI("http://openstates.org/api/v1//events/?state=#{state}&format=json&apikey=65773587715a49ab90960ff88a098c56")
		# 	result = Net::HTTP.get(uri)
		# 	JSON.parse(result)	
		# end
	
end









$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'net/http'
require 'json'

module OpenStates
	class Client
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
	end
end









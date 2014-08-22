#Open States 


This is a Ruby wrapper for the Open States API that accesses information regarding bills, legislators and events.

##Getting Started
1. Obtain an API key at **http://sunlightfoundation.com/api/accounts/register/**
2. Install the gem
    * A. To your system
       * gem install openstates-ruby
    
    * B. Or using Bundler
       * Inside your Gemfile:
       * gem 'openstates-ruby'
3. Create a new OpenStates
    example = OpenStates.new
4. Use your API key
    @key = "apikey=YOURKEYGOESHERE"

##API calls

get_states_info(info_type, state_abbr= nil, add_info = nil)

info_type :
* metadata
* bills
* legislators
* events


example: get_state('bills', 'CT')

####Required arguments 

- Bills - info_type and state_abbr
- Metadata - info_type
- Legislators - info_type and state_abbr
- Events - info_type and state_abbr

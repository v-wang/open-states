$LOAD_PATH.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
	s.name = "open_states"
	s.version = "0.0.1"
	s.platform = Gem::Platform::RUBY
	s.author = "Victor Wang"
	s.email = ["vw475155@gmail.com"]
	s.homepage = "http://github.com/v-wang/open_states"
	s.summary = "Easily access the Open States API."
	s.description = "This is a Rubby wrapper for the Open States API, a live JSON API that provides information on the legislators and activities for all 50 states as well as Washington, D.C. and Puerto Rico. This gem mirrors the documentation."
	s.license = "GPLv2"
	s.required_ruby_version = ">=1.9.2"
	s.files = "lib/open_states.rb"
end
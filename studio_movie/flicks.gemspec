Gem::Specification.new do |s|
	s.name				= "flicks"
	s.version     = "1.0.0"
	s.author			= "Brandon Braun"
	s.email				= "brandon.braun@gmail.com"
	s.summary			= "Plays and reviews movies"
	s.homepage		= "http://bmb330.github.io/"

	s.files				= Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
	s.test_files  = Dir["spec/**/*"]
	s.executables = ["flicks"]

	s.required_ruby_version = ">=2.2"
	s.add_development_dependency 'rspec'
end


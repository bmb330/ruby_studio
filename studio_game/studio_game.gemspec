Gem::Specification.new do |s|
	s.name					= "Studio Game"
	s.version				= "1.0.0"
	s.author				= "Brandon Braun"
	s.email					= "brandon.braun@gmail.com"
	s.homepage			= "http://bmb330.github.io/"
	s.summary				= "Game where players are w00ted and blammed"
	s.description		= File.read(File.join(File.dirname(__FILE__), 'README'))
	s.licenses			= ["MIT"]
	s.files					= Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
	s.test_files		= Dir["spec/**/*"]
	s.executables		= [ 'studio_game' ]
	s.required_ruby_version = '>=1.9'
	s.add_development_dependency 'rspec'
end


Gem::Specification.new do |s|
	s.platform = Gem::Platform::RUBY
	s.name = "chukan"
	s.summary = "automation library for distributed systems"
	s.version = "0.1.0"
	s.date = "2009-11-25"
	s.author = "FURUHASHI Sadayuki"
	s.email = "frsyuki@users.sourceforge.jp"
	#s.homepage = "http://github.com/frsyuki/chukan"
	s.require_paths = ["lib"]
	s.files = ["lib/**/*"].map {|g| Dir.glob(g) }.flatten +
		%w[README]
	#s.test_files = Dir.glob("test/test_*.rb")
end


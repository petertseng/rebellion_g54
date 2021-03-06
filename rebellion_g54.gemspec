Gem::Specification.new do |s|
  s.name          = 'rebellion_g54'
  s.version       = '2.0.0'
  s.summary       = 'Rebellion G54'
  s.description   = 'Backend for managing a Rebellion G54 game'
  s.authors       = ['Peter Tseng']
  s.email         = 'pht24@cornell.edu'
  s.homepage      = 'https://github.com/petertseng/rebellion_g54'

  s.files         = Dir['LICENSE', 'README.md', 'lib/**/*']
  s.test_files    = Dir['spec/**/*']
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end

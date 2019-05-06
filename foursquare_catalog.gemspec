$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'foursquare_catalog'
  s.version     = '1.0'
  s.date        = '2019-05-06'
  s.summary     = 'foursquare_catalog - Simple gem for parsing meta information'
  s.description = 'Simple gem for parsing meta information from websites.'
  s.author      = 'Alokhina Mariia'
  s.email       = 'mariia.alokhina@gmail.com'
  s.homepage    = 'https://github.com/MariiaAlehina/foursquare_catalog'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.add_dependency('nokogiri', '~> 1.7', '>= 1.7.0')
end
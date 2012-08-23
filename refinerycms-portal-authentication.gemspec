# Encoding: UTF-8
version = '2.0.8'

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-portal-authentication}
  s.version           = version
  s.summary           = %q{Extended authentication extension for Refinery CMS}
  s.description       = %q{Custom authentication extension for Refinery CMS that supports registration and confirmation}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.rubyforge_project = %q{refinerycms}
  s.authors           = ['Philip Arndt', 'Uģis Ozols', 'Rob Yurkowski', 'David Jones', 'Steven Heidel', 'Juozas Gaigalas']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency 'refinerycms-core',  version
  s.add_dependency 'devise',            '~> 2.0.0'
  s.add_dependency 'orm_adapter',       '~> 0.0.7'
end

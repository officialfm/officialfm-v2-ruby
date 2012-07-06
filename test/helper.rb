if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-gem-adapter'

  SimpleCov.start 'gem'
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'officialfm'

require 'test/unit'
require 'shoulda'
require 'matchy'


require 'json'
Dir.glob('src/*/*.rb').each { |file|
  require File.expand_path("../#{file}", __FILE__)
}
$path = 'scores.json'

Action.new(ARGV[0]).judge

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.warnings = false
end

ChefSpec::Coverage.start!

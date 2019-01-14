require "json"

require_relative 'nightshift_manager'
require_relative 'interim'
require_relative 'intern'
require_relative 'medic'
require_relative 'worker'
require_relative 'shift'
require_relative 'commission'

# your code
file      = File.read('data.json')
data_hash = JSON.parse(file)

manager = NightshiftManager.new(data_hash)
manager.run
manager.export

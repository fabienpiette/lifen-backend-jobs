require "json"

require_relative 'nightshift_manager'
require_relative 'intern'
require_relative 'medic'
require_relative 'worker'
require_relative 'shift'

# your code
file      = File.read('data.json')
data_hash = JSON.parse(file)

manager = NightshiftManager.new(data_hash)
manager.run
manager.export

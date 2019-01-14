require "json"

# your code
file      = File.read('data.json')
data_hash = JSON.parse(file)
workers   = data_hash['workers']
shifts    = data_hash['shifts']
output    = {
  'workers' => []
}

workers.each do |worker|
  price = shifts.select { |s| s['user_id'] == worker['id'] }.length * worker['price_per_shift'].to_i
  id    = worker['id']

  output['workers'] << {
    id: id,
    price: price
  }
end

File.open('output.json', 'w') { |f| f << JSON.pretty_generate(output) }

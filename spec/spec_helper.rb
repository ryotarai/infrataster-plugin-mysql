require 'infrataster/rspec'
require 'infrataster-plugin-mysql'

Infrataster::Server.define(
  :db,
  '192.168.44.20',
  vagrant: true,
  mysql: {user: 'app', password: 'app'},
)

Infrataster::Server.define(
  :db_database_name,
  '192.168.44.20',
  vagrant: true,
  mysql: {user: 'app', password: 'app', database: 'mysql'},
)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

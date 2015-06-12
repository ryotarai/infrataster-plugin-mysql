require 'rspec'
require 'infrataster/resources'

module Infrataster
  module Helpers
    module ResourceHelper
      def mysql_query(*args)
        Resources::MysqlQueryResource.new(*args)
      end
    end
  end
end

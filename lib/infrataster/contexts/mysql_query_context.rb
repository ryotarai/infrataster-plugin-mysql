require 'infrataster'
require 'mysql2-cs-bind'

module Infrataster
  module Contexts
    class MysqlQueryContext < BaseContext
      def results
        options = {port: 3306, user: 'root', password: ''}
        if server.options[:mysql]
          options = options.merge(server.options[:mysql])
        end
        options = options.merge(resource.options)

        server.forward_port(options[:port]) do |address, new_port|
          mysql_options = {
            host: address, port: new_port,
            username: options[:user], password: options[:password]
          }
          if options.key?(:database)
            mysql_options[:database] = options[:database]
          end
          client = Mysql2::Client.new(mysql_options)
          client.xquery(resource.query, *resource.params)
        end
      end
    end
  end
end




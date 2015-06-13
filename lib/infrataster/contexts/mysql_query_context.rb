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

        server.forward_port(options[:port]) do |address, new_port|
          client = Mysql2::Client.new(
            host: address,
            port: new_port,
            username: options[:user],
            password: options[:password],
          )
          client.xquery(resource.query, *resource.params)
        end
      end
    end
  end
end




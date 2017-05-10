require 'infrataster'

module Infrataster
  module Resources
    class MysqlQueryResource < BaseResource
      Error = Class.new(StandardError)

      attr_reader :query, :params, :options

      def initialize(query, *args)
        @query = query
        @options = args.last.is_a?(Hash) ? args.pop : {}
        @params = args
      end

      def to_s
        "mysql '#{@query}' with #{@params}"
      end
    end
  end
end



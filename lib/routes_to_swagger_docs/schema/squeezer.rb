# frozen_string_literal: true

require 'forwardable'
require 'r2-oas/schema/v3/squeezer'

module RoutesToSwaggerDocs
  module Schema
    class Squeezer
      extend Forwardable

      def_delegators :@squeezer, :squeeze_docs

      def initialize(schema_data, options = {})
        case ::RoutesToSwaggerDocs.version
        when :v3
          @squeezer = V3::Squeezer.new(schema_data, options)
        else
          raise NoImplementError, "Do not support version: #{::RoutesToSwaggerDocs.version}"
        end
      end
    end
  end
end

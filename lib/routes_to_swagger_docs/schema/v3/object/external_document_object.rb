# frozen_string_literal: true

require 'routes_to_swagger_docs/plugins/schema/object/hookable_base_object'

module RoutesToSwaggerDocs
  module Schema
    module V3
      class ExternalDocumentObject < RoutesToSwaggerDocs::Plugins::Schema::V3::HookableBaseObject
        def create_doc
          result = {
            'description' => '',
            'url' => ''
          }
          doc.merge!(result)
        end
      end
    end
  end
end

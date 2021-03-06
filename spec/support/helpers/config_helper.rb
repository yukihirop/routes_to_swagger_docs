# frozen_string_literal: true

module ConfigHelper
  def reset_config
    R2OAS.configure do |config|
      config.version                            = :v3
      config.root_dir_path                      = Rails.root.join('oas_docs').to_s
      config.schema_save_dir_name               = 'src'
      config.doc_save_file_name                 = 'oas_doc.yml'
      config.force_update_schema                = false
      config.use_tag_namespace                  = true
      config.use_schema_namespace               = true
      config.interval_to_save_edited_tmp_schema = 15

      config.server.data = [
        {
          url: 'http://localhost:3000',
          description: 'localhost'
        }
      ]

      config.swagger.configure do |swagger|
        swagger.ui.image            = 'swaggerapi/swagger-ui'
        swagger.ui.port             = '8080'
        swagger.ui.exposed_port     = '8080/tcp'
        swagger.ui.volume           = '/app/swagger.json'
        swagger.editor.image        = 'swaggerapi/swagger-editor'
        swagger.editor.port         = '81'
        swagger.editor.exposed_port = '8080/tcp'
      end

      config.http_statuses_when_http_method = {
        get: {
          default: %w[200 422],
          path_parameter: %w[200 404 422]
        },
        post: {
          default: %w[201 422],
          path_parameter: %w[201 404 422]
        },
        patch: {
          default: %w[204 422],
          path_parameter: %w[204 404 422]
        },
        put: {
          default: %w[204 422],
          path_parameter: %w[204 404 422]
        },
        delete: {
          default: %w[200 422],
          path_parameter: %w[200 404 422]
        }
      }

      config.http_methods_when_generate_request_body = %w[post patch put]
      config.ignored_http_statuses_when_generate_component_schema = %w[204 404]

      # MEMO:
      # The initial value was changed on the way, so it is not the initial value.
      # It is a compromise because the number of corrections becomes huge.
      #
      # :dot or :underbar
      config.namespace_type = :underbar
      config.plugins = []
      config.output_path = Rails.root.join('oas_docs/dist/oas_doc.yml').to_s
      config.deprecation.silenced = false
    end
  end
end

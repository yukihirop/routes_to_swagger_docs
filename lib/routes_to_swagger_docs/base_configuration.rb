#frozen_string_literal: true

require_relative 'base_configuration/server'
require_relative 'base_configuration/swagger'
require_relative 'base_configuration/paths_config'
require_relative 'logger/stdout_logger'

module RoutesToSwaggerDocs
  module BaseConfiguration
    DEFAULT_ROOT_DIR_PATH = "./swagger_docs"
    DEFAULT_SCHEMA_SAVE_DIR_NAME = "schema"
    DEFAULT_DOC_SAVE_FILE_NAME = "swagger_doc.yml"
    DEFAULT_FORCE_UPDATE_SCHEMA = false
    DEFAULT_USE_TAG_NAMESPACE = true
    DEFAULT_USE_SCHEMA_NAMESPACE = true
    DEFAULT_SERVER = Server.new
    DEFAULT_INTERVAL_TO_SAVE_EDITED_TMP_SCHEMA = 1
    DEFAULT_SWAGGER = Swagger.new

    PUBLIC_VALID_OPTIONS_KEYS = [
      :root_dir_path,
      :schema_save_dir_name,
      :doc_save_file_name,
      :force_update_schema,
      :use_tag_namespace,
      :use_schema_namespace,
      :server,
      :interval_to_save_edited_tmp_schema,
      :swagger
    ]

    UNPUBLIC_VALID_OPTIONS_KEYS = [
      :paths_config
    ]

    VALID_OPTIONS_KEYS = PUBLIC_VALID_OPTIONS_KEYS + UNPUBLIC_VALID_OPTIONS_KEYS

    attr_accessor *VALID_OPTIONS_KEYS

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def logger
      @stdout_logger ||= StdoutLogger.new
    end

    def paths_config
      @_paths_config ||= PathsConfig.new(root_dir_path, schema_save_dir_name)
    end

    private

    module_function

    def set_default(target)
      target.root_dir_path                      = DEFAULT_ROOT_DIR_PATH
      target.schema_save_dir_name               = DEFAULT_SCHEMA_SAVE_DIR_NAME
      target.doc_save_file_name                 = DEFAULT_DOC_SAVE_FILE_NAME
      target.force_update_schema                = DEFAULT_FORCE_UPDATE_SCHEMA
      target.use_tag_namespace                  = DEFAULT_USE_TAG_NAMESPACE
      target.use_schema_namespace               = DEFAULT_USE_SCHEMA_NAMESPACE
      target.server                             = DEFAULT_SERVER
      target.interval_to_save_edited_tmp_schema = DEFAULT_INTERVAL_TO_SAVE_EDITED_TMP_SCHEMA
      target.swagger                            = DEFAULT_SWAGGER
    end
  end
end
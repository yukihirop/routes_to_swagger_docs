# frozen_string_literal: true

module R2OAS
  class Base
    def initialize(options = {})
      @options = options

      (AppConfiguration::VALID_OPTIONS_KEYS + options.keys).each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    private

    attr_accessor *AppConfiguration::VALID_OPTIONS_KEYS

    def merged_options
      if @options.present?
        R2OAS.options.merge(@options)
      else
        R2OAS.options
      end
    end

    def logger
      R2OAS.logger
    end

    def schema_save_dir_path
      File.expand_path("#{root_dir_path}/#{schema_save_dir_name}")
    end

    def doc_save_file_path
      File.expand_path("#{root_dir_path}/#{doc_save_file_name}")
    end

    def ns_div
      case namespace_type
      when :dot
        '.'
      when :underbar
        '_'
      else
        raise "Do not support #{namespace_type}"
      end
    end
  end
end

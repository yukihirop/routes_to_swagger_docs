# frozen_string_literal: true

require 'forwardable'
require 'fileutils'
require_relative 'object_generator'
require 'r2-oas/schema/v3/manager/file/components_file_manager'

module R2OAS
  module Schema
    module V3
      module Components
        class RequestBodyGenerator < ObjectGenerator
          private

          # override
          def process_when_generate_docs
            logger.info " <Update Components schema files (#{@major_category}/#{@middle_category})>"
            @components_objects&.each do |schema_name, data|
              result = {
                @major_category => {
                  @middle_category => { schema_name.to_s => data.slice('content') }
                }
              }

              relative_path = "#{@major_category}/#{@middle_category}/#{schema_name}"
              file_manager = ComponentsFileManager.build(relative_path, :relative)
              save_file_path = file_manager.save_file_path(type: :relative)
              store.add(save_file_path, result.to_yaml)

              if data.key?('has_one') && data['has_one']['type'].eql?('schema')
                original_path = data['has_one']['original_path']
                file_manager = ComponentsFileManager.new(original_path, :ref)
                result = data['has_one']['data']
                save_file_path = file_manager.save_file_path(type: :relative)
                store.add(save_file_path, result.to_yaml)
              end

              yield save_file_path if block_given?
            end
          end
        end
      end
    end
  end
end

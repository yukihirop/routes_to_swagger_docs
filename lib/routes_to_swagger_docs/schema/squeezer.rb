require_relative 'squeezer/base_squeezer'
require_relative 'squeezer/tag_squeezer'
require_relative 'squeezer/path_squeezer'
require_relative 'squeezer/components_squeezer'

module RoutesToSwaggerDocs
  module Schema
    class Squeezer < BaseSqueezer
      def remake_docs
        except_paths_schema = @schema_data.except("paths", "tags", "components")
        
        path_squeezer = PathSqueezer.new(@schema_data, unit_paths_file_path: unit_paths_file_path)
        tag_squeezer = TagSqueezer.new(@schema_data, unit_paths_file_path: unit_paths_file_path)
        components_squeezer = ComponentsSqueezer.new(@schema_data, unit_paths_file_path: unit_paths_file_path)
        
        slice_schemas = [
          tag_squeezer.remake_tags,
          path_squeezer.remake_paths,
          components_squeezer.remake_components
        ]
        slice_schemas.each_with_object(except_paths_schema) { |slice_schema, result| result.deep_merge!(slice_schema)}
      end
    end 
  end
end
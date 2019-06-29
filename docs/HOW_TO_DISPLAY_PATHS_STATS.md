## Basic Usage

```ruby

require 'routes_to_swagger_docs'

RoutesToSwaggerDocs.configure do |config|
   # default setting        
   config.root_dir_path = "./swagger_docs"
   config.schema_save_dir_name = "shemas"
   config.doc_save_file_name = "swagger_doc.yml"

   config.tool.paths_stats.configure do |paths_stats|
    paths_stats.month_to_turn_to_warning_color = 3
    paths_stats.warning_color                  = :red
    paths_stats.table_title_color              = :yellow
    paths_stats.heading_color                  = :yellow
   end
end
```

```bash
$ bundle exec rake routes:swagger:paths_stats
+----+--------------------------------------------------------+---------------------------+---------------------------+
|                                                     Paths Stats                                                     |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| No | File Path                                              | Created At                | Updated At                |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 1  | swagger_docs/schema/paths/user.yml                     | 2019-06-29 00:39:27 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 2  | swagger_docs/schema/paths/api/v1/account_user_role.yml | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 3  | swagger_docs/schema/paths/api/v1/user.yml              | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 4  | swagger_docs/schema/paths/api/v1/account.yml           | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 5  | swagger_docs/schema/paths/api/v1/task.yml              | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 6  | swagger_docs/schema/paths/api/v1/post.yml              | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 7  | swagger_docs/schema/paths/api/v2/custom_post.yml       | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 8  | swagger_docs/schema/paths/api/v2/post.yml              | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 9  | swagger_docs/schema/paths/task.yml                     | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 10 | swagger_docs/schema/paths/rails_admin/engine.yml       | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+
| 11 | swagger_docs/schema/paths/rails_admin/main.yml         | 2019-06-29 00:28:56 +0900 | 2019-06-29 01:20:33 +0900 |
+----+--------------------------------------------------------+---------------------------+---------------------------+

Red: over 3 months since the last update.
```
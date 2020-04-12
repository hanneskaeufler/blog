class RemoveRawHtmlMarkers::V20200412112418 < Avram::Migrator::Migration::V1
  def migrate
    execute "UPDATE posts SET content = REPLACE(content, 'RAW_HTML_START', '<!-- RAW_HTML_START -->')"
    execute "UPDATE posts SET content = REPLACE(content, 'RAW_HTML_END', '<!-- RAW_HTML_END -->')"
  end

  def rollback
    execute "UPDATE posts SET content = REPLACE(content, '<!-- RAW_HTML_START -->', 'RAW_HTML_START')"
    execute "UPDATE posts SET content = REPLACE(content, '<!-- RAW_HTML_END -->', 'RAW_HTML_END')"
  end
end

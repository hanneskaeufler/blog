require "lucky_cli"

class Db::Deploy < LuckyCli::Task
  PG_DUMP   = "/Applications/Postgres.app/Contents/Versions/10/bin/pg_dump"
  DUMP_NAME = "blog_development.dump"
  DB_NAME   = "blog_development"
  DROPBOX   = "~/Dropbox/Public"

  banner "Export database and prepare to mirror it to heroku"

  def call
    dump_db
    copy_db_to_dropbox
    open_dropbox_to_get_link
    link = wait_for_public_link
    restore_db_from_dump(fix_dropbox_link(link))
  end

  private def fix_dropbox_link(link : Nil)
    raise ArgumentError.new("Please enter a link.")
  end

  private def fix_dropbox_link(link : String) : String
    link.gsub("www.dropbox.com", "dl.dropboxusercontent.com")
  end

  private def restore_db_from_dump(link)
    `heroku pg:backups:restore '#{link}' DATABASE_URL`
  end

  private def wait_for_public_link
    puts "Paste the dropbox link now:"
    gets
  end

  private def open_dropbox_to_get_link
    `open #{DROPBOX}`
  end

  private def copy_db_to_dropbox
    `cp #{DUMP_NAME} #{DROPBOX}`
  end

  private def dump_db
    `#{PG_DUMP} -Fc --no-acl --no-owner -h localhost #{DB_NAME} > #{DUMP_NAME}`
  end
end

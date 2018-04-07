require "lucky_cli"
require "readline"

class DeployDb < LuckyCli::Task
  PG_DUMP = "/Applications/Postgres.app/Contents/Versions/10/bin/pg_dump"
  DUMP_NAME = "blog_development.dump"
  DB_NAME = "blog_development"
  DROPBOX = "~/Dropbox/Public"

  banner "Export database and prepare to mirror it to heroku"

  def call
    read_line
    # dump_db
    # copy_db_to_dropbox
    # open_dropbox_to_get_link
    # link = wait_for_public_link
    # puts "Okay, heroku pg:backups:restore '#{link}' DATABASE_URL"
  end

  private def wait_for_public_link
    puts "Paste the dropbox link now:"
    gets
  end

  private def open_dropbox_to_get_link
    # `open #{DROPBOX}`
  end

  private def copy_db_to_dropbox
    `cp #{DUMP_NAME} #{DROPBOX}`
  end

  private def dump_db
    `#{PG_DUMP} -Fc --no-acl --no-owner -h localhost #{DB_NAME} > #{DUMP_NAME}`
  end
end

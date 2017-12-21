require "./browser_action"

abstract class AdminAction < BrowserAction
  before require_dev

  private def require_dev
    if Lucky::Env.production?
      redirect to: Blog::Posts::Index
    else
      continue
    end
  end
end

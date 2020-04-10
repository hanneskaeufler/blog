abstract class BrowserAction < Lucky::Action
  include Lucky::ProtectFromForgery

  accepted_formats [:html], default: :html
end

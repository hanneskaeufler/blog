class Blog::Components::GoogleAnalytics < BaseComponent
  needs is_production : Bool

  def render
    return unless @is_production
    raw <<-RAW
      <script async src="https://www.googletagmanager.com/gtag/js?id=UA-10194989-1"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-10194989-1');
      </script>
    RAW
  end
end

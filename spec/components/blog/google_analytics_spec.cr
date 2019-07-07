describe Blog::Components::GoogleAnalytics do
  describe "#render" do
    it "outputs the google analytics snipped in production" do
      Blog::Components::GoogleAnalytics.new(is_production: true).render_to_string
        .should contain "gtag"
    end

    it "outputs nothing in development" do
      Blog::Components::GoogleAnalytics.new(is_production: false).render_to_string
        .should eq ""
    end
  end
end

class Blog::Feed < ApiAction
  param page : Int32 = 1

  get "/feed.json" do
    json(FeedSerializer.new(PostQuery.new.latest.results,
      PostQuery.new.published.select_count,
      page))
  end
end

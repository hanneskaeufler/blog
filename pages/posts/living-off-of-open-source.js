import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "living-off-of-open-source",
  title: "Living off of open-source",
  publishedAt: "2017-12-19T21:47:38",
  content: `For the second year in a row now I have participated in *Hacktoberfest*, an open-source initiative by [DigitalOcean](https://digitalocean.com), a cloud infrastructure provider. What's the deal? You, fellow open-source contributor, just have to open a handful of pull-request during the timeframe of October 1st to 31st. DigitalOcean will be generous and send you a limited edition t-shirt for free (well, for your time spent on those 5 pull-requests that is). Here's the two shirts I got for my 2016 and 2017 efforts:
<!-- RAW_HTML_START --><blockquote class="twitter-tweet" data-lang="de"><p lang="en" dir="ltr">Hacktoberfest swaaaag. Open-Source for life. Thanks <a href="https://twitter.com/digitalocean?ref_src=twsrc%5Etfw">@DigitalOcean</a>! <a href="https://twitter.com/hashtag/Hacktoberfest?src=hash&amp;ref_src=twsrc%5Etfw">#Hacktoberfest</a> <a href="https://twitter.com/hashtag/opensource?src=hash&amp;ref_src=twsrc%5Etfw">#opensource</a> <a href="https://t.co/2zXdxElrCj">pic.twitter.com/2zXdxElrCj</a></p>&mdash; Hannes Käufler (@hanneskaeufler) <a href="https://twitter.com/hanneskaeufler/status/943238389704388608?ref_src=twsrc%5Etfw">19. Dezember 2017</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script><!-- RAW_HTML_END -->
Needless to say, I find that an awesome initiative, seeing that the world builds upon open-source software. The five pull-requests that got me my t-shirt this year were:
* [Increase test coverage on administrate](https://github.com/thoughtbot/administrate/pull/1000)
* [Improve german translation on administrate](https://github.com/thoughtbot/administrate/pull/1002)
* [Add unit tests for previously uncovered code in a laravel caching lib](https://github.com/GeneaLabs/laravel-model-caching/pull/18)
* [Improve modularity of code in solar-system game](https://github.com/Zac-Garby/solar-system/pull/33)
* [Add hover effect in play button](https://github.com/Zac-Garby/solar-system/pull/53)

To finish this off I can't recommend participating in Hacktoberfest enough, and thanks to DigitalOcean to appreciate this by giving you a t-shirt.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

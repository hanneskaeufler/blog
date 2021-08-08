import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "50-million-lines-of-bugs",
  title: "50 Million Lines of Bugs",
  publishedAt: "2017-12-08T23:11:06",
  content: `I often think about the following Mercedes-Benz advert:

<!-- RAW_HTML_START --><blockquote class="twitter-tweet" data-lang="de"><p lang="en" dir="ltr">You can tell a lot about a car company that thinks having 100 million lines of code is something to brag about... <a href="https://t.co/E5LO5N85AG">pic.twitter.com/E5LO5N85AG</a></p>&mdash; Leisa Reichelt (@leisa) <a href="https://twitter.com/leisa/status/769392533059276800?ref_src=twsrc%5Etfw">27. August 2016</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script><!-- RAW_HTML_END -->

In what world having whatever many lines of code should be something to brag about is beyond me. The tweet already hints at this nicely. But the marketing department seemed to have a different opinion in this case.

While I don't have credible numbers to back this, I think we can agree more code correlates with more bugs in some way. So Mercedes-Benz, please, try to keep the number of lines of code in your cars as low as possibly can be.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

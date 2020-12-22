import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "lucky-crystal",
  title: "Lucky Crystal",
  publishedAt: "2017-12-03 11:50:31.000629+00",
  content: `In the ever changing landscape of web frameworks, there is a new kid on the block: [Lucky](http://luckyframework.org). Lucky is written in [Crystal](http://crystal-lang.org), a statically typed programming language heavily inspired by [Ruby's](http://ruby-lang.org) syntax, which claims to be
> Fast as C, slick as Ruby

For this blog however, being as fast as C is mostly irrelevant, I'm sure it'd be plenty fine running in Ruby as well. What I rather value is developer productivity, or "getting something done in half an hour before going to bed". On that end, the Lucky + Crystal combination performed pretty well and I got a rewrite of this website shipped in a few hours of work.

## Type safe html

What I find super interesting about Lucky is the way it deals with the task of rendering html. While the plethora of templating engines like [ERB](http://ruby-doc.org/stdlib-2.4.2/libdoc/erb/rdoc/ERB.html), [Twig](https://twig.symfony.com) or Crystal's [ECR](https://crystal-lang.org/api/0.23.1/ECR.html) are easy to work with and simple enough to understand, there's something about using plain Crystal code to markup html. The following gist is an example method from this blogs source code:

<!-- RAW_HTML_START --><script src="https://gist.github.com/hanneskaeufler/df48f4ee11c332c92efbc157c85174e9.js"></script><!-- RAW_HTML_END -->

As you can see it was trivial to extract methods to render reoccuring or more complex parts of the layout. It's just code. Also the compiler will complain if we produce invalid code, so we cannot forget to close tags. That's kind of a big deal to me.

I look forward to spending more time in Lucky and Crystal, they both get a thumbs up for now!`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

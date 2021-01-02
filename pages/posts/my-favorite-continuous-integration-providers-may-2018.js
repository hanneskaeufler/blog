import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "my-favorite-continuous-integration-providers-may-2018",
  title: "My favorite continuous integration providers (May 2018)",
  publishedAt: "2018-05-24 18:18:10+00",
  type: "long-form",
  content: `Seeing the following tweet yesterday, which links to a [great article](https://t.co/1pERihonQY) comparing multiple CI/CD providers

<!-- RAW_HTML_START --><blockquote class="twitter-tweet" data-lang="de"><p lang="en" dir="ltr">I&#39;m starting a review blog for all things related to iOS development. Check out my first review on CI services!<a href="https://t.co/1pERihonQY">https://t.co/1pERihonQY</a></p>&mdash; Oliver Clark Rickard (@ocrickard) <a href="https://twitter.com/ocrickard/status/999389350113824768?ref_src=twsrc%5Etfw">23. Mai 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script><!-- RAW_HTML_END -->

made me realize that I did indeed go through most of them at some point in time. So very shortly, here are my two cents:

<!--more-->

## CircleCI

I agree with the article, it's great, I use it to do [CI/CD for this very website](https://circleci.com/gh/hanneskaeufler/blog). Nothing much to say. The build UI is not great on mobile though. Cannot do iOS/Android builds though?

## Travis CI

Still use it, gets the job done. Nothing more to add. It's running the [danger-todoist builds](https://travis-ci.org/hanneskaeufler/danger-todoist).

## Bitrise

I found the configuration weird in the beginning, but you can get used to it. Major plus: Can do both my iOS and Android builds for [PitBuddy App](http://pitbuddyapp.com) for _private repositories_.

## Nevercode

I think Nevercode aquired Buddybuild at some point. I was using Buddybuild for iOS builds and when I started to get an Android build going it just was impossible to setup and massively unreliably. Can't say much about Nevercode, but I am happy I left Buddybuild for Bitrise.

## Bitbucket Pipelines

Obviously [I just recently](posts/ftp-lives-deploying-a-static-site-with-bitbucket-pipelines) started using it, so far so good. Can't do iOS/Android. Build speeds are great up until now.

## Gitlab CI

Is this the solution to doing both web, iOS and Android in one tool? Hosting the code there as well? Seems tempting! I like Gitlab the SCM tool, and Gitlab CI has come a long way.

That's it, just a quick reminder on what I already tried and would like to try.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

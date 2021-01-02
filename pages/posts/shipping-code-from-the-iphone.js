import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "shipping-code-from-the-iphone",
  title: "Shipping code from the iPhone",
  publishedAt: "2018-05-04 18:39:43+00",
  type: "long-form",
  content: `After traveling abroad for more than two weeks, and then spending two days laying by the pool, I naturally got a bit of a tech craving. To spend the afternoon I set myself the challenge of fixing a small bug on this blog, having nothing more than some Hotel WiFi™ and my iPhone at hand. But that must be enough, right? Let‘s see how it went.

<!--more-->

### The objective

In this blog I display a permalink hash next to the blog posts title, which is a link to view the post separately as well. When using e.g. Safari‘s „Reader“ mode, this hash symbol is of no use and should not be there.

￼![Initial Bug](http://heinz-kaeufler.de/hannes/blog/initial-bug.jpg)

### The journey

So how can we get started on this? First we need access to the repo of course. I had come across an app called [Working Copy](https://itunes.apple.com/de/app/working-copy/id896694807?mt=8), and looking that up in the App Store was promising: I can check out the repo to my iPhone. What a time to be alive!
￼
Not only can I check out the source code, but it comes with text editing capabilities as well. Making the change was pretty easy it seemed. I first browsed for the test that verifies the permalink, and removed the expected hash symbol from there.

Which lead to the first realization: I cannot run the tests on my iPhone. While that definitely kills the quick feedback loop I so much long for, it is fine for very simple changes (because CI will save me) and the occasional holiday-deploy. Alas I made the change, committed and pushed, and opened the PR. Opening the PR can be done on [github.com](https://github.com), however strangely only via the desktop version. This triggers the continuous integration build on [circleci.com](https://circleci.com), and duly notified me that I forgot to make the production code change to go with the test change! Oh well, another commit and push and I was looking good, build passing. At least concerning the crystal code. But what about the CSS? For now I had only removed the hash symbol, but we still want it to be there through CSS. So that‘s limitation two: I have no way to play around with the CSS on the blog. Firstly because of the lack of an actual dev environment on the phone, but also because I don’t yet run visual regression testing on CI. My way out of this was to fire up [codepen.io](https://codepen.io) and use that as a playground. Again, because the change was pretty trivial and I just needed to confirm one assumption I had. That assumption proved true and with it I was ready to merge the PR, using GitHub's website. As continuous deployment was already set up as well this was actually all there was to it. The build job passed as expected, sending off the deploy job straight after it and after 5 minutes or so I could visit the live page and confirm that indeed everything still looks the same, but the hash symbol is not showing up in Reader mode. Cool ✅

<!-- RAW_HTML_START --><p class="image-container-two"><img src="http://heinz-kaeufler.de/hannes/blog/fixed-bug.PNG" alt="Fixed bug"/><img src="http://heinz-kaeufler.de/hannes/blog/fixed-bug-visual.PNG" alt="Fixed bug visual"/></p><!-- RAW_HTML_END -->

### The aftermath

Switching between GitHub's mobile and desktop version was kind of clunky and still didn't allow me to upload any screenshots. I then realized that my twitter feed had mentioned [Ryan Nystroms](https://twitter.com/_ryannystrom) [GitHawk](https://itunes.apple.com/app/githawk-for-github/id1252320249) in the past. One more trip to the App Store and yes yes yes, that is much more pleasant than the website!

Editing issues / PRs is way more comfortable and image upload works as intended. That will be a much better combo I think, I am looking forward to using that for the next exercise.

### What Worked

* Making trivial code changes directly from within [@WorkingCopyApp](https://twitter.com/workingcopyapp)
* Pushing that change to GitHub
* Opening a pull request via the desktop version of github.com
* Updating issues/PRs in [@githawk](https://twitter.com/githawk)

### What didn‘t work

* Building/pushing a new docker image. I could have tried to install via the Dockerfile, but without building and pushing the new image this still gets me nowhere
* Uploading screenshots to issues on the github.com website
* Quickly seeing the effects of both crystal code as well as CSS changes. Waiting on CI works for the code, CSS is still push and pray (working on it)
* Publishing a blog post about this journey. I can only create new posts locally and sync the dev database to production from my development environment. I guess that needs to change!? (Might be the excuse to build a json api powered endpoint and an iPhone app to go with it 😎)

Of course this exercise was purely recreational. I was in no way forced to write or deploy code from halfway across the world on my iPhone, but I kind of wanted to.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "refactoring-css",
  title: "Refactoring CSS",
  publishedAt: "2018-04-08T10:32:19",
  type: "long-form",
  content: `One shortcoming of this permanently-work-in-progress blog of mine was the rendering on mobile devices. The experience of browsing the blog on a phone or tablet was less than ideal: text touching the borders of the screen, images overflowing the main section, social media links being out of place, and many more. It was a long standing [issue](https://github.com/hanneskaeufler/blog/issues/5). So I set off on fixing this. While digging straight into the first CSS changes and fiddling in the developer console of Chrome, I remembered what I wrote in the [Snapshot TDD](/posts/snapshot-tdd) post:

> Things of visual nature are not unit-tested easily, which is why they are often simply untested. We usually don't test stylesheets, colors, images etc. However we can't say those things are unimportant.

<!--more-->

Unhappy about the workflow I just started and taking into account the above thought, I typed some words into google and emerged with this awesome tool: [BackstopJS](https://garris.github.io/BackstopJS/). It's headlined with "Visual regression testing for web apps" and was _exactly_ what I was looking for. It provides a safety net for changing the visual nature of something rendered in a browser by taking and comparing screenshots. Basically exactly what I manually and crudely setup for the e-ink dashboard, just **so much** more awesome.

## Setup and usage
Both setting up and using BackstopJS is dead simple and can be explained in this short snippet:

\`\`\`sh
# Install backstopjs locally
yarn add backstopjs

# Setup folders, configuration etc.
./node_modules/.bin/backstopjs init

# Edit backstop.json to configure the viewports you want to test on.
# I use the following:
#  "viewports": [
#    {
#      "label": "phone",
#      "width": 320,
#      "height": 480
#    },
#    {
#      "label": "tablet",
#      "width": 1024,
#      "height": 768
#    },
#    {
#      "label": "desktop",
#      "width": 2880,
#      "height": 1800
#    }
#  ]

# Define some pages you want to visit/compare, e.g.
#  "scenarios": [
#    {
#      "label": "Blog Index",
#      "url": "http://localhost:5000"
#    }

# Finally run backstop tests to go ahead and capture first set of images
./node_modules/.bin/backstop test
\`\`\`

You will get a really nice page telling you that the tests were failing. Why? Because you have not approved any reference images yet. Once you look at those images and assert that this is currently the way things are looking, go ahead and \`backstop approve\` those. Now you are golden and able to make changes to your pages CSS without having to fear to a) break thinks if you are refactoring, or b) having a super quick way to get an overview of the changes you made across multiple pages of your blog in different viewports.

## Normalize

With my page being a blog, the content obviously will continuously change, making the comparison of the current look against reference images unfeasable. Luckily this is an easy fix: I created a new database containing exactly one sample post, which uses all the usual tags like h1-h6, lists, blockquotes to showcase most of the styles coming into play.

\`\`\`sh
# Create and migrate a new database just for visual regression testing
LUCKY_ENV=visual_test lucky db.create && lucky db.migrate

# Add one sample post
open http://localhost:5000/posts/new

# Run the local server with that one sample post
LUCKY_ENV=visual_test lucky dev
\`\`\`

This is how the current reference image looks in tablet mode:

![Tablet reference image for sample post](https://github.com/hanneskaeufler/blog/raw/f0637b2649786b981461370a6081d4b118532586/backstop_data/bitmaps_reference/backstop_default_Blog_Index_0_document_1_tablet.png)

## Conclusion

As always, you can follow along to the [PR on github](https://github.com/hanneskaeufler/blog/pull/47). One example of a change to the reference image can be seen [here](https://github.com/hanneskaeufler/blog/pull/47/commits/7d7a7828cc0a5efbe160f9a4676e5bdc7b1507ed?short_path=631552d#diff-631552d0ccfacaf0fbd66a6ed3080d85). I must say I am mega impressed with BackstopJS and will try to use that again in the future. One open task is to get that running on CircleCI as well.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

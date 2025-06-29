import Layout from "@/components/layout";
import Full from "@/components/posts/full";

export const post = {
  slug: "gallerymagic-20-years-late",
  title: "My new App GalleryMagic is 20 years late to the market",
  publishedAt: "2025-06-29T16:00:00",
  content: `[My new macOS app GalleryMagic](https://usegallerymagic.com) is available on the App Store. Arguably, it is 20 years late to an already saturated market. I built it anyway.

<div class="p-5 rounded-lg bg-indigo-200 border-2 border-indigo-400 hover:bg-indigo-100 hover:border-indigo-300 align-items-center">
  <a href="https://apps.apple.com/us/app/gallerymagic/id6744827234?mt=12&itscg=30200&itsct=apps_box_badge&mttnsubad=6744827234" class="flex no-underline" style="color: rgb(75, 85, 99); font-weight: normal !important">
    <img src="/gallerymagic-icon.png" class="rounded-lg w-24 h-24" style="margin: 0 !important;"/>
    <p class="pl-5 content-center" style="margin: 0px !important">
      Check out <strong>GalleryMagic</strong> yourself. Create beautiful galleries of your photos in seconds. It's a free download!
    </p>
  </a>
</div>

Ever wanted to send a collection of photos to a friend or family member? Maybe you wanted to share some photos from your last vacation, or a birthday party, or just some random photos you took? There's already a plethora of ways to do this. Flickr, Google Photos, Apple Photos, Dropbox, you name it. But they all have one thing in common: You can't really influence the visual appearance of your gallery all that much. With GalleryMagic you can, based on a set of templates that come with the app (and both existing customization points as well as more to come). With some in-app purchases, you can also publicly host your galleries on the internet, so you can share them with anyone that has a webbrowser

This is what a demo gallery looks like:

![GalleryMagic example gallery](gallerymagic-example.png)

Given my sister sometimes has the need for html galleries of her photos, I had dabbled in gallery generation before. Static site generators like Jekyll or Hugo can do this, but they are not for the faint of heart (read: your mom). I have probably four or five abandoned prototypes on my private git repos, all of varying technological background that I was interested in at the time. Ruby code packaged in a way so it can be embedded in a macOS app, a SwiftUI app that tries to embed one of the existing open-source html gallery generators, and so on. None of them ever made it to any real usable state let alone to the App Store.

### Fueled by AI

Now what made me start to dabble in this again? The belief that I can build a simple app that does this *in a weekend* (care to take a guess if this estimation turned out to be the case?), given we now have AI assistants left right and center. I had so far been disappointed by the quality of results the AI assistants could produce. Claude code changed that one evening and I came away impressed. So off I went one evening, vibecoding my way through some rough ideas, and by the following evening I had a working prototype that could generate a simple html gallery from a set of photos. By that point, the app was all local, simple html produced on your machine, no network involved. Claude did help me patching together a SwiftUI interface with a Rust CLI to do the image manipulation. HTML generation is implemented in Swift as well. So far, this turned out to be a great combination. For me, because I like both Swift and Rust, and for the app, because the ecosystems both lend themselves well to the respective tasks.

![Claude reporting on commits in the repo](claude-commits.png)
*See Claude struggling to identify the work it did.*

Now today, or 601 commits later, the vibecoding part has only been a small part of the development. Out of all commits, only 21 were made by claude. So arguably most of the praise I can give to claude code is that it got me started by *making me believe I can ship this quickly.* And so I did. I shipped an embarrasingly work in progress app to the macOS App Store on May 2nd 2025, got rejected by App Review twice and finally got approved on May 3rd. Since then I have shipped 10 updates to arrive at version 1.5 today, June 29th.

### Development is 30% of the effort

As usual, the development of the app itself has been the easy part. The hard part, for me, is everything else that comes with shipping an app: Marketing content, the App Icon, App Store bureacracy, and **most of all getting the app noticed by potential users**. So in order to aid visibility, I'll crank out a couple more blog posts about the app. So far, I have already submitted the app to [macupdate.com](https://gallerymagic.macupdate.com) and [built a website](https://usegallerymagic.com). I'll also do forum posts, post on slack channels, and try to look into Apple App Store Ads, which I have used in the past for iOS but so far can't grok how to use it for the macOS App Store. My original plan was to, as quickly as possible, get a feel for the potential of the app. Only if there are early signs of there being a market for it, had I planned to invest more time into the app. Given that I enjoy working on it, I haven't been that true to this plan. It's *really hard* judging an MVP of a product and be willing to ship something you're not proud of or even embarrassed by.

### What next?

I'll end this here with the output of cloc as of today. This includes the app itself, the website, the infrastructure code for the hosting as well as the image manipulation CLI. It always surprises me how little code it really takes to build something like this.

<pre>
----------------------------------------------------------------
Language      files          blank        comment           code
----------------------------------------------------------------
Swift            49            358             85           3552
HTML             12            183             30           1574
Rust              2            105             40            613
Python            7             99             45            553
XML               7              0              0            248
Markdown          4             53              0            183
JSON              7              0              0            182
SVG               6              0              5             60
CSS               1              7              0             50
TOML              3              9              0             49
YAML              3              0              0             32
make              1              2              0              5
----------------------------------------------------------------
SUM:            102            816            205           7101
----------------------------------------------------------------
</pre>
`
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

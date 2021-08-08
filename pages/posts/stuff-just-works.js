import Layout from "@/components/layout";
import Full from "@/components/posts/full";

export const post = {
  slug: "stuff-just-works",
  title: "Sometimes stuff just works",
  publishedAt: "2021-08-08T02:00:00",
  content: `Software development is full of trip-wires, broken processes, short-living projects and more which often times make a developer's life difficult. Most software being broken all of the time is a very common sentiment in the industry. Developer tooling is also very easily neglegted. Believe it or not, against all expectations, a short while ago I had a pleasant experience:

My iOS App PitBuddy is still on the AppStore, but I had last shipped an update more than two years ago. I don't actively develop it anymore; let's say it is in maintenance mode. However, in iOS 13 I believe, some change in the default iOS styling led to a placeholder text in one of the apps TextViews be difficult to read. Should be easy enough to fix, I thought. Thing is, I hadn't even checked out the repo on my current machine let alone built the Xcode project. The project is a mix of Objective-C, some Swift, Cocoapods for any app dependencies. Now that's where most would assume I would have run into a world of hurt. However, I didn't:

    bundle install --path=vendor/bundle

just worked. After that

    bundle exec pod install

just worked as well. That's where I started to feel like I'm in a dream. Opening the project via

    xed PitbuddyApp.xcworkspace

and building it via Cmd+B ran into a couple of minor warnings, but it completed just fine and I was able to run it in the simulator. By that point there was only one thing left to do: run tests. PitBuddyApp has a number of unit tests which built and passed, so that box was checked. I also have a couple of "Acceptance Tests" in place, using the KIF ui testing framework. So those didnt
't pass. However, I simply bumped KIF to the lastest version, and alas, I was back in the green. All in all, from cloning the repo to a fully passing build and test suite it took me no more than 30 minutes. So what do we take away from this?

* Sometimes things just work
* Dependency pinning (both the Gems as well as the Cocoapods) is good
* The bump from Xcode 10 to 12 needed a bump of KIF

Thanks to everyone helping maintain bundler, cocoapoda, etc!`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

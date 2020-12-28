import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "lucky",
  title: "Lucky",
  publishedAt: "2016-06-01 08:56:11+00",
  content: `I really can't stand much of the negativity some people exhibit in their daily lives. [Just give it a second](https://www.youtube.com/watch?v=ZFsOUbZ0Lr0) dude. Sometimes we really need to take a step back and appreciate what we take for granted. Without further ado, here's list of problems you probably never needed to worry about:

* Not having an absurd amount of food at your fingertips.
* Getting medical attention should you need it.
* Freezing to death in winter.
* Having bombs dropped on your town.

And with those menaces out of the picture, you are likely free to enjoy all of this:

* ~~Sleeping with one leg out of the covers.~~
* Doing something you like as a job.
* Have meaningful free time to fill with hobbys, sport, socialising.
* Fly anywhere in the world (within reason).

I just feel that this has to be called to mind from time to time. [This is not the norm. You are rich.](http://www.investopedia.com/articles/personal-finance/050615/are-you-top-one-percent-world.asp)`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

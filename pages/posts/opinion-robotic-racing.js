import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "opinion-robotic-racing",
  title: "Opinion: Robotic racing",
  publishedAt: "2018-07-15T20:17:06",
  content: `[Roborace](https://roborace.com), the autonomous racing company and car, has recently competed in the Goodwood Festival Of Speed. I am a huge proponent of autonomy in the automotive sector as a whole, but sporadically following Roborace's public outings make me wonder if autonomous racing will ever be a thing. Watch the hillclimb first:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/QtVbch-02Fs?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

A few questions answered first: Do I think this is impressive? Absolutely. Massive props to the team of engineers that got this car speeding up that hill. Do I think this makes sense? Totally, those outings push forward the state of autonomous driving for sure. So this post is _not at all_ a bash on the achievements or intentions of Roborace at all.

But can I imagine myself watching a race of autonomous vehicles, should it ever happen? Hard to tell, but it sure doesn't get me to the edge of my seat right now. Reflecting on why I dig watching F1 or AMA Pro Supercross, the "human" parts (the odd errors, emotions, sense of danger ...) are most certainly a factor. Let's see where this goes, and make a call once we _actually_ see an autonomous race on real racetracks.

Bonus, the onboard:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/b6OHDlSnSo8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

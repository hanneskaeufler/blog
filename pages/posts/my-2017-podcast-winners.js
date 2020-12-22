import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "my-2017-podcast-winners",
  title: "My 2017 podcast winners",
  publishedAt: "2017-12-22 22:38:49+00",
  content: `In 2017 I have likely listened to hundreds of hours of podcasts. Out of interest, lets do the math real quick: \`50 weeks until now * 5 podcasts * 1h average length = 250h\`. So yeah, hundreds of hours it is. But I definitely don't consider that to be wasted time, but sometimes great entertainment, time spent learning, or a soothing tone to fall asleep to. Without much further ado, here's what I have been listening to in 2017, in no particular order:

* [2 Dope Queens](https://overcast.fm/itunes1097193327/2-dope-queens): Phoebe Robinson and Jessica Williams are two friends hosting a hilarious live comedy show. They literally crack me up each episode and easily brighten my mood for quite a while. Funniest podcast I know.
* [Scrum Master Toolbox Podcast](https://overcast.fm/itunes963592988/scrum-master-toolbox-podcast): Each episode is around eleven minutes long and is a concise discussion about the daily work and struggle of the scrum master trade. Vasco Duarte does a great job in keeping those episodes short and to the point. Great way to learn some useful tips from more experienced agile coaches/scrum masters.
* [Missed Apex Podcast](https://overcast.fm/itunes1097310026/missed-apex-podcast): This was a new discovery for me in 2017 and made the formula 1 season so much more enjoyable. The f1 race reviews are both funny and informative. The host Spanners Ready leads a crew of journalists and f1 fans to produce these reviews but also more technical shows and interviews with people of f1 fame. A must listen!
* [The Bike Shed](https://overcast.fm/itunes935763119/the-bike-shed): This has nothing to do with bikes, but is a semi-random conversation between Derek Prior, Sean Griffin, Amanda Hill and various guests on IT topics such as Ruby on Rails, Active Record, Diesel, mixed with stories on consulting work, rockets and anything else that might come up. I find it provides a nice mix of interesting technical discussions and light-hearted banter.
* [Accidental Tech Podcast](https://overcast.fm/itunes617416468/accidental-tech-podcast): The trio of Casey Liss, Marco Arment and John Siracusa do a great job of endlessly discussing the world of Apple and related surrounding topics. This is definitely the podcast I have been following for the longest time.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

import Layout from "@/components/layout";
import Full from "@/components/posts/full";

export const post = {
  slug: "2021-supercross-predictions",
  title: "2021 Supercross Predictions",
  publishedAt: "2020-12-28 23:00:00+00",
  type: "long-form",
  summary: `<img src="/supercross.jpg" class="w-full h-48 object-cover rounded-lg shadow" />With 2020 coming to a close, the 2021 Monster Energy AMA Supercross season is right around the corner. The first round is [scheduled to be](https://racerxonline.com/2020/12/15/redux-2021-supercross-schedule) held in Houston, Texas on January 16th. This gives us a couple of days to think about who will be coming out on top in both the 450, 250 East and 250 West classes. Actually, the 250 entry lists aren't public yet, so we can only try to predict the 250 field as a whole, not knowing who will line up on either the west or east rounds' gates. That sounds a bit too artificial, so let's focus on the 450 division.`,
  content: `<img src="/supercross.jpg" class="w-full h-48 object-cover rounded-lg shadow" />With 2020 coming to a close, the 2021 Monster Energy AMA Supercross season is right around the corner. The first round is [scheduled to be](https://racerxonline.com/2020/12/15/redux-2021-supercross-schedule) held in Houston, Texas on January 16th. This gives us a couple of days to think about who will be coming out on top in both the 450, 250 East and 250 West classes. Actually, the 250 entry lists aren't public yet, so we can only try to predict the 250 field as a whole, not knowing who will line up on either the west or east rounds' gates. That sounds a bit too artificial, so let's focus on the 450 division.

As supercross is a dangerous sport with injuries making up large parts of the harsh reality, it is one of the most difficult series to predict. I also have no inside knowledge about any of the teams or riders, so my predictions might not materialise at all. But it will be fun to look back and see how I did.

### 450 division

Right off the bat, here's how I think the standings up to fifth will end up looking like after the season finale in round 17:

1. Cooper Webb
2. Eli Tomac
3. Zack Osborne
4. Ken Roczen
5. Malcom Stewart

Intentionally I have not factored in any injuries into the ranking, as those are impossible to predict. So let's go into a bit of detail on each of the riders to disect their rank.

#### Cooper Webb - #2

Yes, I believe we will have a repeat champion in Cooper. [He was sidelined](https://racerxonline.com/2020/08/18/cooper-webb-back-out-for-motocross-season) for most of 2020 to heal up an injury he sustained back in the past Supercross season. That's actually why I think he will come out on top: He will be hungry for wins after missing most of Motocross and sustaining that crash in Dallas which surely affected his Supercross season as well. He didn't change anything major in his program as far as I can tell, so he will be quite comfortable with his setup. Webb also isn't one to shine with [god-like speed](https://www.youtube.com/watch?v=DK8rQsL3y_k) and then crash out spectacularly. He comes across as a hunter, a consistent grinder, and he has proven already that he has the speed to win a couple of rounds.

#### Eli Tomac - #3

Eli will for sure be a factor in the battle for the championship. He now is an SX champion as well after winning the shortened 2020 campaign, deservedly so. However he kind of looked a little lackluster to me in MX this season. Did he just lose a couple of tenths a lap after becoming a father? Probably not, but to be honest I don't think the fire burns inside of him just as much as in Cooper, so I think he will be beat by just a number of mediocre rounds.

#### Zack Osborne - #16

A bit of a sleeper in Supercross, my prediction is that Zack will do good, but not great, in Supercross. He has the program, the bike and the mental strength to grind through the season. He did win the 2020 outdoor national championship, but I also believe he is better outdoors. Surely a win or two will come his way, but not quite enough to be further up top.

#### Ken Roczen - #94

Ken is a rider I wished would beat my prediction. He has huge potential but has come short of grabbing that championship trophy for a number of years now. He usually made the headlines with horrendous injuries more than with a consistent season right up until the end. His recent past proved a bit better, as he was riding through the entire SX season, only to then sit out the outdoor season due to his body not feeling quite right. I sure hope he will have a great campaign, as he is such a talented rider.

#### Malcom Stewart - #27

Traditionally one not to race the motocross season to focus on supercross, Malcom, brother to aforementioned [legend](https://en.wikipedia.org/wiki/James_Stewart_Jr.) James, has again switched teams. He has been quite unlucky in the past with not getting the bike he deserves and with breaking his leg a year ago. Solid speed and a little bit of luck to get consistent results can net him a top 5 season in my opinion. Fingers crossed.

#### Honorable mentions

So there you have it, that's my prediction. I can't wait to find out how it holds. Now there's still a whole boatload of riders that could have made the list. Adam Cianciarulo, Chase Sexton, Jason Anderson, Justin Barcia, Dean Wilson are all names that one could put into that top 5 prediction. As it stands though, I think all of them are lacking just a tiny part in their race outfit, be it consistency or racecraft.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

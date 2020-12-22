import { Github, Twitter, Xing } from "@/components/icons";
import Preview from "@/components/posts/preview";
import Head from "next/head";
import Link from "next/link";

import { post as crystalCoveragePost } from "./posts/measuring-code-coverage-in-crystal-with-kcov";

// ||50 - million - lines - of - bugs.js||chrome - vs - safari.js||danger -
//         todoist - celebrates - 200k - downloads.js||living - off - of - open -
//         source.js||local - variable.js||lucky -
//         crystal.js||lucky.js||measuring - code - coverage - in
//     - crystal - with - kcov.js||my - 2017 - podcast - winners.js||saturday.js

import { post as bugsPost } from "./posts/50-million-lines-of-bugs";
import { post as dangerTodoistDownloadsPost } from "./posts/danger-todoist-celebrates-200k-downloads";
import { post as openSourcePost } from "./posts/living-off-of-open-source";
import { post as luckyCrystalPost } from "./posts/lucky-crystal";
import { post as podcastWinnersPost } from "./posts/my-2017-podcast-winners";

import { post as chromePost } from "./posts/chrome-vs-safari";
import { post as luckyPost } from "./posts/lucky";
import { post as localVariablePost } from "./posts/local-variable";
import { post as saturdayPost } from "./posts/saturday";

function QuickLink({ target, label, children, ...props }) {
  return (
    <Link href={target}>
      <a className="bg-black bg-opacity-20 text-green-50 text rounded-full py-2 px-3 hover:bg-green-600 transition flex items-center">
        {children}
        <span className="ml-1 hidden md:inline">{label}</span>
      </a>
    </Link>
  );
}

function Banner() {
  return (
    <div className="px-2 py-12 shadow-lg bg-white rounded-md text-5xl text-indigo-500 font-bold text-center">
      racing · software · open-source
    </div>
  );
}

function Home({ posts }) {
  return (
    <div className="container mx-auto flex-grow">
      <Head>
        <title key="title">Hannes Käufler: Blog</title>
      </Head>
      <div className="blog-title">
        <div className="flex space-x-2 py-7 justify-center text-lg">
          <QuickLink label="github" target="https://github.com/hanneskaeufler">
            <Github className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
          <QuickLink
            label="twitter"
            target="https://twitter.com/hanneskaeufler"
          >
            <Twitter className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
          <QuickLink
            label="xing"
            target="https://xing.com/profile/Hannes_Kaeufler "
          >
            <Xing className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
        </div>
        <Banner />
      </div>
      <div className="mt-20 space-y-20">
        {posts.map((post) => (
          <Preview key={post.slug} post={post} />
        ))}
      </div>
    </div>
  );
}

Home.getInitialProps = () => {
  return {
    posts: [
      crystalCoveragePost,
      bugsPost,
      dangerTodoistDownloadsPost,
      openSourcePost,
      luckyCrystalPost,
      podcastWinnersPost,
      chromePost,
      luckyPost,
      localVariablePost,
      saturdayPost,
    ],
  };
};

export default Home;

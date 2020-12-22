import Head from "next/head";
import Link from "next/link";

import { Github, Twitter, Xing } from "@/components/icons";
import Preview from "@/components/posts/preview";

import { post as crystalCoveragePost } from "./posts/measuring-code-coverage-in-crystal-with-kcov";
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
            target="https:/ /
       twitter.com / hanneskaeufler "
          >
            <Twitter className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
          <QuickLink
            label="xing"
            target="https:/ /
       xing.com / profile / Hannes_Kaeufler "
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
      chromePost,
      luckyPost,
      localVariablePost,
      saturdayPost,
    ],
  };
};

export default Home;

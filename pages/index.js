import { Github, Twitter, Xing } from "@/components/icons";
import Preview from "@/components/posts/preview";
import Head from "next/head";
import Link from "next/link";
import { useRouter } from "next/router";
import { useState } from "react";

import { post as bugsPost } from "./posts/50-million-lines-of-bugs";
import { post as buildingMutationPost } from "./posts/building-a-mutation-test-framework-in-crystal---part-1";
import { post as chromePost } from "./posts/chrome-vs-safari";
import { post as dangerTodoistDownloadsPost } from "./posts/danger-todoist-celebrates-200k-downloads";
import { post as deployingPost } from "./posts/ftp-lives-deploying-a-static-site-with-bitbucket-pipelines";
import { post as introducingCryticPost } from "./posts/introducing-crytic---mutation-testing-in-crystal-lang";
import { post as openSourcePost } from "./posts/living-off-of-open-source";
import { post as localVariablePost } from "./posts/local-variable";
import { post as luckyPost } from "./posts/lucky";
import { post as luckyCrystalPost } from "./posts/lucky-crystal";
import { post as crystalCoveragePost } from "./posts/measuring-code-coverage-in-crystal-with-kcov";
import { post as podcastWinnersPost } from "./posts/my-2017-podcast-winners";
import { post as favoritePost } from "./posts/my-favorite-continuous-integration-providers-may-2018";
import { post as roboticPost } from "./posts/opinion-robotic-racing";
import { post as testFeedbackPost } from "./posts/quick-test-feedback-with-fswatch";
import { post as refactoringCssPost } from "./posts/refactoring-css";
import { post as saturdayPost } from "./posts/saturday";
import { post as shippingPost } from "./posts/shipping-code-from-the-iphone";
import { post as snapshotPost } from "./posts/snapshot-tdd";

const perPage = 5;

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
  const router = useRouter();
  const currentPosts = getPostsForPage(posts, router.query);
  const currentPage = router.query.page ? parseInt(router.query.page, 10) : 1;
  const maxPage = Math.ceil(posts.length / perPage);

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
        {currentPosts.map((post) => (
          <Preview key={post.slug} post={post} />
        ))}
      </div>
      {currentPage < maxPage && (
        <div className="mt-20">
          <Link href={{ query: { page: currentPage + 1 } }}>
            <a className="underline">Next page &raquo;</a>
          </Link>
        </div>
      )}
    </div>
  );
}

function getPostsForPage(posts, query) {
  const page = query.page ? query.page : 1,
    start = (page - 1) * perPage,
    end = start + perPage;
  return posts.slice(start, end);
}

Home.getInitialProps = async () => {
  const posts = [
    crystalCoveragePost,
    buildingMutationPost,
    introducingCryticPost,
    testFeedbackPost,
    roboticPost,
    favoritePost,
    deployingPost,
    shippingPost,
    refactoringCssPost,
    snapshotPost,
    bugsPost,
    dangerTodoistDownloadsPost,
    openSourcePost,
    luckyCrystalPost,
    podcastWinnersPost,
    chromePost,
    luckyPost,
    localVariablePost,
    saturdayPost,
  ];

  return { posts: posts };
};

export default Home;

import Preview from "@/components/posts/preview";
import ProminentLink from "@/components/prominentLink";
import BlogTitle from "@/components/blogTitle";
import Head from "next/head";
import Link from "next/link";
import { useRouter } from "next/router";

import { post as galleryMagicIntro } from "./posts/gallerymagic-20-years-late";
import { post as stuffJustWorks } from "./posts/stuff-just-works";
import { post as composableArchitectureReview } from "./posts/composable-architecture-review";
import { post as sx2021Post } from "./posts/2021-supercross-predictions";
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

function Home() {
  const router = useRouter(),
    posts = getAllPosts(),
    currentPosts = getPostsForPage(posts, router.query),
    currentPage = router.query.page ? parseInt(router.query.page, 10) : 1,
    maxPage = Math.ceil(posts.length / perPage);

  return (
    <div className="container mx-auto flex-grow px-2">
      <Head>
        <title key="title">Hannes Käufler: Blog</title>
      </Head>
      <BlogTitle />
      <div className="mt-20 space-y-24">
        {currentPosts.map((post) => (
          <Preview key={post.slug} post={post} />
        ))}
      </div>
      <div className="mt-20 flex flex-col md:flex-row space-y-2 md:space-y-0 justify-center">
        {currentPage > 1 && (
          <ProminentLink
            href={{ query: { page: currentPage - 1 } }}
            className="md:mr-4"
          >
            &laquo; Previous page
          </ProminentLink>
        )}
        {currentPage < maxPage && (
          <ProminentLink
            href={{ query: { page: currentPage + 1 } }}
            className="justify-end"
          >
            Next page &raquo;
          </ProminentLink>
        )}
      </div>
    </div>
  );
}

function getPostsForPage(posts, query) {
  const page = query.page ? query.page : 1,
    start = (page - 1) * perPage,
    end = start + perPage;
  return posts.slice(start, end);
}

function getAllPosts() {
  return [
    galleryMagicIntro,
    stuffJustWorks,
    composableArchitectureReview,
    sx2021Post,
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
}

export default Home;

import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "quick-test-feedback-with-fswatch",
  title: "Quick test feedback with fswatch",
  publishedAt: "2018-07-28T18:08:50",
  content: `[Loads](https://github.com/guard/guard) of [tools](https://jestjs.io/docs/en/getting-started#running-from-command-line) exist for continuously monitoring files on your disk for changes and running the tests whenever a change happened. Some test runners do that by themselves, others don't and rely on additional tools. The crystal test runner doesn't provide such an option, so I looked for an alternative. The easiest I found was the following:

\`fswatch -or ./src ./spec | xargs -I{} crystal spec\`

fswatch is using the system's (e.g. macOS) filesystem events to get notified of changes in files. Combining this with a pipe to xargs is making for a super simple tool to execute \`crystal spec\` whenever I change either a test or a production code file. Now for the arguments used:

* \`-r,  -recursive\` to fswatch is recursing subdirectories such that e.g. ./src/foo/bar.cr is watched as well
* \`-o,  --one-per-batch\` to fswatch is batching the filesystem events, otherwise you will get two triggers of your command for a single save in vim
* \`-I{}\` to xargs specifies that none of the inputs piped in by fswatch are taken into account, because we are not using the replacement character \`{}\` in the \`crystal spec\` part. As the test suite is fast enough, I just run it in its entirety all the time.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

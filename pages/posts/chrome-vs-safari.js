import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "chrome-vs-safari",
  title: "Chrome vs Safari",
  publishedAt: "2016-06-01 14:23:28.167643+00",
  content: `Chrome and Safari are both great browsers. They each have their pros and cons. I tend to be undecided on which one I like better.
Chrome has great [developer tools](https://developer.chrome.com/devtools). I never really warmed up to Safari's. As usual, Safari is tightly integrated
with OS X. Tab sync to iOS's Safari being one of them. Generally using less memory. Lately I tend to use Safari more then Chrome. But out of old habits
I often start a new window in Chrome and browse for a few minutes before remembering that I wanted to use Safari. So here it is, the solution ~~to all of my problems~~
to a tiny annoyance of my incredibly blessed life:

<!-- RAW_HTML_START --><script src="https://gist.github.com/hanneskaeufler/4b94e292372639fde003729726500669.js"></script><!-- RAW_HTML_END -->

This will take all of your windows and tabs you currently have open in Google Chrome, and replicate them in Safari. Switch browsers with the touch of a button.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

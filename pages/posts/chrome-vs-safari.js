import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "chrome-vs-safari",
  title: "Chrome vs Safari",
  publishedAt: "2016-06-01 14:23:28+00",
  content: `Chrome and Safari are both great browsers. They each have their pros and cons. I tend to be undecided on which one I like better.
Chrome has great [developer tools](https://developer.chrome.com/devtools). I never really warmed up to Safari's. As usual, Safari is tightly integrated
with OS X. Tab sync to iOS's Safari being one of them. Generally using less memory. Lately I tend to use Safari more then Chrome. But out of old habits
I often start a new window in Chrome and browse for a few minutes before remembering that I wanted to use Safari. So here it is, the solution ~~to all of my problems~~
to a tiny annoyance of my incredibly blessed life:

\`\`\`
tell application "Google Chrome"
	set allUrls to {}
	repeat with theWindow in every window
		set urlsInWindow to {}
		repeat with theTab in every tab of theWindow
			set currentUrl to the theTab's URL
			set urlsInWindow to urlsInWindow & {currentUrl}
		end repeat
		set allUrls to allUrls & {urlsInWindow}
	end repeat
end tell

tell application "Safari"
	repeat with aWindow in every list of allUrls
		make new document
		activate
		repeat with aUrl in every string of aWindow
			open location aUrl
		end repeat
	end repeat
end tell

tell application "Google Chrome" to quit
\`\`\`

This will take all of your windows and tabs you currently have open in Google Chrome, and replicate them in Safari. Switch browsers with the touch of a button.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

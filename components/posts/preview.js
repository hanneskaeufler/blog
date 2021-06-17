import PostBody from "@/components/posts/body";
import PostHead from "@/components/posts/head";
import Link from "next/link";
import ProminentLink from "@/components/prominentLink";

const SUMMARY_MARKER = "<!--more-->";

export default function Preview({ post }) {
  const perma = `/posts/${post.slug}`;
  const type = post.type ?? "short-form";

  let content;
  if (type == "long-form") {
    content = post.content.split(SUMMARY_MARKER)[0];
  } else {
    content = post.content;
  }

  return (
    <article>
      <PostHead post={post} />
      <PostBody content={content} />
      {type == "long-form" && (
        <div className="mt-8">
          <ProminentLink href={perma}>
            Continue reading
            <svg
              className="h-4 w-4 ml-2"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
            >
              <path
                fillRule="evenodd"
                d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                clipRule="evenodd"
              />
            </svg>
          </ProminentLink>
        </div>
      )}
    </article>
  );
}

import PostBody from "@/components/posts/body";
import PostHead from "@/components/posts/head";
import Link from "next/link";

export default function Preview({ post }) {
  let perma = `/posts/${post.slug}`;
  let type = post.type ?? "short-form";

  let content =
    type == "long-form" ? post.summary ?? post.content : post.content;

  return (
    <article>
      <PostHead post={post} />
      <PostBody content={content} />
      {type == "long-form" && (
        <div className="mt-8">
          <Link href={perma}>
            <a className="py-2 px-4 rounded-full bg-indigo-100 text-indigo-600">
              Continue reading
            </a>
          </Link>
        </div>
      )}
    </article>
  );
}

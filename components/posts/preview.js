import PostBody from "@/components/posts/body";
import PostHead from "@/components/posts/head";
import Link from "next/link";

export default function Preview({ post }) {
  let perma = `/posts/${post.slug}`;

  return (
    <article>
      <PostHead post={post} />
      <PostBody post={post} />
      <Link href={perma}>
        <a className="underline">Read more ...</a>
      </Link>
    </article>
  );
}

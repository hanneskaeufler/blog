import Head from "next/head";
import PostHead from "@/components/posts/head";
import PostBody from "@/components/posts/body";

export default function Full({ post }) {
  return (
    <div className="container mx-auto px-2">
      <Head>
        <title key="title">Hannes Käufler: Blog - {post.title}</title>
      </Head>
      <PostHead post={post} />
      <PostBody content={post.content} />
    </div>
  );
}

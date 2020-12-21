import Link from "next/link";
import ReactMarkdown from "react-markdown";
import gfm from "remark-gfm";

function wordCount(content) {
  return content.split(" ").length;
}

function readingTime(wc) {
  return "2 min";
}

export default function Preview({ post }) {
  let wc = wordCount(post.content);

  return (
    <article>
      <h2 className="text-3xl font-bold text-gray-700">
        <Link href="/">
          <a className="border-transparent border-b hover:border-gray-600 transition inline-block relative">
            <span className="text-gray-300 absolute -left-7">#</span>
            {post.title}
          </a>
        </Link>
      </h2>
      <div className="text-lg text-gray-400 mt-2 mb-4">
        Published on {post.publishedAt} · {wc} words · about {readingTime(wc)}{" "}
        reading time
      </div>
      <div className="mb-4 prose">
        <ReactMarkdown plugins={[gfm]} children={post.content} />
      </div>
      <Link href={post.slug}>
        <a className="underline">Read more ...</a>
      </Link>
    </article>
  );
}

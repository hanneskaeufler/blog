import dayjs from "dayjs";
import Link from "next/link";

function wordCount(content) {
  return content.split(" ").length;
}

function readingTime(wc) {
  return "2 min";
}

function publishedAt(date) {
  return `${dayjs(date).format("MMMM DD, YYYY")}`;
}

export default function Head({ post }) {
  let wc = wordCount(post.content);
  let perma = `/posts/${post.slug}`;

  return (
    <div>
      <h2 className="text-3xl font-bold text-gray-700">
        <Link href={perma}>
          <a className="border-transparent border-b hover:border-gray-600 transition inline-block relative">
            <span className="text-gray-300 absolute -left-7">#</span>
            {post.title}
          </a>
        </Link>
      </h2>
      <div className="text-lg text-gray-400 mt-2 mb-4">
        Published on {publishedAt(post.publishedAt)} · {wc} words · about{" "}
        {readingTime(wc)} reading time
      </div>
    </div>
  );
}

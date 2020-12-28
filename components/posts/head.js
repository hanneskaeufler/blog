import dayjs from "dayjs";
import Link from "next/link";

function wordCount(content) {
  return content.split(" ").length;
}

function readingTime(wc) {
  const speed = 200; // 200 words per minute
  if (wc < speed) {
    return "less than a minute";
  }

  const minutes = Math.floor(wc / speed);

  return `about ${minutes} min`;
}

function publishedAt(date) {
  return `${dayjs(date).format("MMMM DD, YYYY")}`;
}

export default function Head({ post }) {
  let wc = wordCount(post.content);
  let perma = `/posts/${post.slug}`;

  return (
    <div>
      <h2 className="text-3xl font-bold text-gray-700 mb-2">
        <Link href={perma}>
          <a className="border-transparent border-b hover:border-gray-600 transition inline-block relative">
            <span className="text-gray-300 absolute -left-7">#</span>
            {post.title}
          </a>
        </Link>
      </h2>
      <div className="text-lg text-gray-400 mb-10">
        Published on {publishedAt(post.publishedAt)} · {wc} words ·{" "}
        {readingTime(wc)} reading time
      </div>
    </div>
  );
}

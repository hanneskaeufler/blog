/* eslint-disable react/no-children-prop */
import ReactMarkdown from "react-markdown";
import gfm from "remark-gfm";
import rehypeRaw from "rehype-raw";

export default function Body({ content }) {
  return (
    <div className="mb-4 prose prose-indigo prose-lg">
      <ReactMarkdown
        rehypePlugins={[rehypeRaw]}
        remarkPlugins={[gfm]}
        children={content}
      />
    </div>
  );
}

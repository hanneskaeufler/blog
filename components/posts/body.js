/* eslint-disable react/no-children-prop */
import ReactMarkdown from "react-markdown";
import gfm from "remark-gfm";
import rehypeRaw from "rehype-raw";
import rehypeSanitize, { defaultSchema } from "rehype-sanitize";

export default function Body({ content }) {
  return (
    <div className="mb-4 prose prose-indigo prose-lg">
      <ReactMarkdown
        rehypePlugins={[rehypeRaw, [rehypeSanitize, defaultSchema]]}
        remarkPlugins={[gfm]}
        children={content}
      />
    </div>
  );
}

/* eslint-disable react/no-children-prop */
import ReactMarkdown from "react-markdown";
import gfm from "remark-gfm";

export default function Body({ content }) {
  return (
    <div className="mb-4 prose prose-indigo prose-lg">
      <ReactMarkdown
        plugins={[gfm]}
        children={content}
        allowDangerousHtml={true} // I embed some raw html, script tags e.g. for github gists
      />
    </div>
  );
}

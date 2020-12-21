import ReactMarkdown from "react-markdown";
import gfm from "remark-gfm";

export default function Body({ post }) {
  return (
    <div className="mb-4 prose">
      <ReactMarkdown
        plugins={[gfm]}
        children={post.content}
        allowDangerousHtml={true} // I embed some raw html, script tags e.g. for github gists
      />
    </div>
  );
}

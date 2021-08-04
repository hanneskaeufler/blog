import Layout from "@/components/layout";
import Full from "@/components/posts/full";

export const post = {
  slug: "stuff-just-works",
  title: "Sometimes stuff just works",
  publishedAt: "2021-08-04 02:00:00+00",
  content: `Software development is full of trip-wires, broken processes, short-living projects and more to often times make a developer's life difficult.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}

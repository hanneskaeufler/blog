import { Github, Twitter, Xing } from "@/components/icons";
import Preview from "@/components/posts/preview";
import Head from "next/head";
import Link from "next/link";

function QuickLink({ target, label, children, ...props }) {
  return (
    <Link href={target}>
      <a className="bg-black bg-opacity-20 text-green-50 text rounded-full py-2 px-3 hover:bg-green-600 transition flex items-center">
        {children}
        <span className="ml-1 hidden md:inline">{label}</span>
      </a>
    </Link>
  );
}

function Banner() {
  return (
    <div className="px-2 py-12 shadow-lg bg-white rounded-md text-5xl text-indigo-500 font-bold text-center">
      racing · software · open-source
    </div>
  );
}

export default function Home() {
  return (
    <div className="container mx-auto flex-grow">
      <Head>
        <title>Hannes Käufler: Blog</title>
      </Head>
      <div className="blog-title">
        <div className="flex space-x-2 py-7 justify-center text-lg">
          <QuickLink label="github" target="https://github.com/hanneskaeufler">
            <Github className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
          <QuickLink
            label="twitter"
            target="https:/ /
       twitter.com / hanneskaeufler "
          >
            <Twitter className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
          <QuickLink
            label="xing"
            target="https:/ /
       xing.com / profile / Hannes_Kaeufler "
          >
            <Xing className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
          </QuickLink>
        </div>
        <Banner />
      </div>
      <div className="mt-20">
        <Preview
          post={{
            slug: "measuring-code-coverage-in-crystal-with-kcov",
            title: "Measuring code coverage in crystal with kcov",
            publishedAt: "February 24, 2019",
            content:
              "## Hi\nThis could work\n* A buller\n* Another bukketjhj:w\n| Foo | Bar |\n|-----|-----|\n| hi | there |\n",
          }}
        />
      </div>
    </div>
  );
}

import Head from "next/head";
import Link from "next/link";
import { Github, Twitter, Xing } from "@/components/icons";

function QuickLink({ target, label, children, ...props }) {
  return (
    <Link href={target}>
      <a className="bg-green-800 text-green-50 text rounded-full py-2 px-4 hover:bg-green-900 transition flex items-center">
        {children} <span className="ml-3 hidden md:inline">{label}</span>
      </a>
    </Link>
  );
}

function Banner() {
  return (
    <div className="px-2 py-12 shadow-lg bg-white rounded-md text-5xl text-purple-600 font-bold text-center">
      racing · software · open-source
    </div>
  );
}

export default function Home() {
  return (
    <div className="container mx-auto">
      <div className="blog-title">
        <div className="flex space-x-2 py-8 justify-center">
          <QuickLink label="github" target="https://github.com/hanneskaeufler">
            <Github className="w-4 h-4 text-white" />
          </QuickLink>
          <QuickLink
            label="twitter"
            target="https://twitter.com/hanneskaeufler"
          >
            <Twitter className="w-4 h-4 text-white" />
          </QuickLink>
          <QuickLink label="xing" target="https://xing.com/hanneskaeufler">
            <Xing className="w-4 h-4 text-white" />
          </QuickLink>
        </div>
        <Banner />
      </div>
    </div>
  );
}

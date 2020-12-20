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
      <div className="mt-20">
        <h2 className="text-3xl font-bold">
          <Link href="/">
            <a className="border-transparent border-b hover:border-gray-600 transition inline-block">
              Measuring code coverage in crystal with kcov
            </a>
          </Link>
        </h2>
        <div className="text-gray-400 mt-2 mb-4">
          Published on February 24, 2019 · 596 words · about 2 min reading time
        </div>
        <p>
          Crystal, the programming language, does not yet provide a built in way
          of measuring the effectiveness of your test suite. So by running
          crystal spec you pretty much only have binary insight into the suite:
          it's passing or it's not. This lead me to build crytic in the first
          place. But while mutation coverage is a great tool to investigate the
          test suite, plain old code coverage is usually quicker to obtain and
          easier to glance at.
        </p>
      </div>
    </div>
  );
}

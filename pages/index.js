import Head from "next/head";
import Link from "next/link";

function QuickLink(props) {
  return (
    <Link href={props.target}>
      <a className="bg-green-800 text-green-50 text rounded-full py-1 px-4 hover:bg-green-900 transition">
        {props.label}
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
          <QuickLink
            label="github"
            target="https://github.com/hanneskaeufler"
          />
          <QuickLink
            label="twitter"
            target="https://twitter.com/hanneskaeufler"
          />
          <QuickLink label="xing" target="https://xing.com/hanneskaeufler" />
        </div>
        <Banner />
      </div>
    </div>
  );
}

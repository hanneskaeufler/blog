import { Github, Twitter, Xing } from "@/components/icons";
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
    <div className="px-2 py-12 shadow-lg bg-white rounded-md text-3xl sm:text-5xl text-indigo-500 font-bold text-center">
      racing · software · open-source
    </div>
  );
}

export default function BlogTitle() {
  return (
    <div className="blog-title">
      <div className="flex space-x-2 py-7 justify-center text-lg">
        <QuickLink label="github" target="https://github.com/hanneskaeufler">
          <Github className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
        </QuickLink>
        <QuickLink label="twitter" target="https://twitter.com/hanneskaeufler">
          <Twitter className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
        </QuickLink>
        <QuickLink
          label="xing"
          target="https://xing.com/profile/Hannes_Kaeufler "
        >
          <Xing className="w-6 h-6 md:h-4 md:h-4 text-black opacity-20" />
        </QuickLink>
      </div>
      <Banner />
    </div>
  );
}

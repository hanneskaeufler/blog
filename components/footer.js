import Link from "next/link";
import { Github, Twitter, Xing } from "@/components/icons";

export default function Footer() {
  return (
    <footer className="mt-10 px-2 border-t-2 border-gray-200 bg-gray-100 text-lg text-gray-600">
      <div class="container mx-auto grid md:grid-cols-2">
        <div className="py-6">
          <h4 className="font-bold text-gray-800 mb-6">Imprint</h4>
          <address className="not-italic">
            Dipl.-Ing. Hannes Käufler
            <br />
            Gluthstraße 8<br />
            80807 München
          </address>
          <div className="flex items-center mt-6 space-x-2">
            <Link href="https://github.com/hanneskaeufler">
              <a>
                <Github className="w-4 h-4 hover:text-gray-900" />
              </a>
            </Link>
            <Link href="https://twitter.com/hanneskaeufler">
              <a>
                <Twitter className="w-4 h-4 hover:text-gray-900" />
              </a>
            </Link>
            <Link href="https://xing.com/profile/Hannes_Kaeufler">
              <a>
                <Xing className="w-4 h-4 hover:text-gray-900" />
              </a>
            </Link>
          </div>
        </div>
        <div className="py-6">
          <h4 className="font-bold text-gray-800 mb-6">From Germany with ❤️</h4>
          <p>
            This blog is open-source, check it out on{" "}
            <Link href="https://github.com/hanneskaeufler/blog">
              <a className="underline hover:text-gray-900">Github</a>
            </Link>
            . It is served by{" "}
            <Link href="https://vercel.com">
              <a className="underline hover:text-gray-900">Vercel</a>
            </Link>
            , written in Javascript 😱 and built with the awesome{" "}
            <Link href="https://nextjs.org">
              <a className="underline hover:text-gray-900">Next.js</a>
            </Link>
            .
          </p>
        </div>
      </div>
    </footer>
  );
}

import "../styles/globals.css";
import Link from "next/link";

function Footer() {
  return (
    <footer className="mt-10 border-t-2 border-gray-200 bg-gray-100 grid grid-cols-2 text-gray-600">
      <div className="p-6">
        <h4 className="font-bold text-gray-800 mb-6">Imprint</h4>
        <address className="not-italic">
          Dipl.-Ing. Hannes Käufler
          <br />
          Gluthstraße 8<br />
          80807 München
        </address>
      </div>
      <div className="p-6">
        <h4 className="font-bold text-gray-800 mb-6">From Germany with ❤️</h4>
        <p>
          This blog is open source, check it out on{" "}
          <Link href="https://github.com/hanneskaeufler/blog">
            <a className="underline">Github</a>
          </Link>
          . It is served by{" "}
          <Link href="https://vercel.com">
            <a className="underline">Vercel</a>
          </Link>
          , written in Javascript and build with the awesome{" "}
          <Link href="https://nextjs.org">
            <a className="underline">Next.js</a>
          </Link>
        </p>
      </div>
    </footer>
  );
}

function MyApp({ Component, pageProps }) {
  return (
    <div className="text-lg text-gray-800 antialiased">
      <Component {...pageProps} />
      <Footer />
    </div>
  );
}

export default MyApp;

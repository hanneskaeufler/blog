import Link from "next/link";

export default function Layout({ children }) {
  return (
    <div>
      <div className="py-4 bg-green-300 mb-14 text-sm font-bold relative">
        <div className="container mx-auto">
          <Link href="/">
            <a className="inline-block border-b border-green-400 text-green-800 hover:border-green-800 transition">
              Home
            </a>
          </Link>
        </div>
      </div>
      {children}
    </div>
  );
}

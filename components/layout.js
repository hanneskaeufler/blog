import Link from "next/link";

export default function Layout({ children }) {
  return (
    <div className="flex-grow">
      <div className="py-4 bg-emerald-300 mb-14 text-sm font-bold relative">
        <div className="container mx-auto px-2">
          <div className="text-emerald-600">
            <Link
              href="/"
              className="border-b border-transparent hover:border-emerald-500 transition"
            >
              racing · software · open-source
            </Link>
          </div>
        </div>
      </div>
      {children}
    </div>
  );
}

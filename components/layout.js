import Link from "next/link";

export default function Layout({ children }) {
  return (
    <div className="flex-grow">
      <div className="py-4 bg-green-300 mb-14 text-sm font-bold relative">
        <div className="container mx-auto">
          <div className="text-green-600">racing · software · open-source</div>
        </div>
      </div>
      {children}
    </div>
  );
}

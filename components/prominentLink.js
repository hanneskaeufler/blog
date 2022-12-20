import Link from "next/link";

export default function ProminentLink({ children, className, ...props }) {
  return (
    (<Link
      {...props}
      className={`text-indigo-600 hover:text-indigo-800 text-right bg-indigo-100 hover:bg-indigo-200 rounded-full py-2 px-4 transition inline-flex items-center ${
        className ?? ""
      }`}>

      {children}

    </Link>)
  );
}

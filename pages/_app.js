import "../styles/globals.css";
import Footer from "@/components/footer";

export default function MyApp({ Component, pageProps }) {
  return (
    <div className="text-lg text-gray-600 antialiased min-h-screen flex flex-col">
      <Component {...pageProps} />
      <Footer />
    </div>
  );
}

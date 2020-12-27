module.exports = {
  purge: ["./pages/**/*.js", "./components/**/*.js"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    screens: {
      sm: "480px",
      md: "768px",
      lg: "976px",
    },
    extend: {
      typography: (theme) => ({
        DEFAULT: {
          css: {
            blockquote: {
              color: theme("colors.gray.500"),
              "border-left-color": theme("colors.green.300"),
            },
            color: theme("colors.gray.600"),
            h2: {
              color: theme("colors.gray.700"),
            },
            h3: {
              color: theme("colors.gray.700"),
            },
            h4: {
              color: theme("colors.gray.700"),
            },
            h5: {
              color: theme("colors.gray.700"),
            },
            h6: {
              color: theme("colors.gray.700"),
            },
          },
        },
      }),
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require("@tailwindcss/typography")],
};

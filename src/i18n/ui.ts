export const languages = {
  en: "EN",
  de: "DE",
} as const;
export type Language = keyof typeof languages;
export const defaultLang = "en";

export const ui = {
  en: {
    nav: {
      home: "About Me",
      cv: "CV",
      test: "Test",
    },
    footer: {
      before: "Source code available on",
      link: "GitHub",
      after: ".",
    },
  },
  de: {
    nav: {
      home: "Über mich",
      cv: "Lebenslauf",
      test: "Täst",
    },
    footer: {
      before: "Quellcode auf",
      link: "GitHub",
      after: "verfügbar.",
    },
  },
};

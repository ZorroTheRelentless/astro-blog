// @ts-check
import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import { visit } from "unist-util-visit";
import sitemap from "@astrojs/sitemap";

function externalLinks() {
  return (tree) => {
    visit(tree, "element", (node) => {
      if (node.tagName !== "a") return;

      const href = node.properties?.href;
      if (typeof href !== "string") return;

      const isExternal = /^https?:\/\//.test(href);

      if (!isExternal) return;

      node.properties.target = "_blank";
      node.properties.rel = "noopener noreferrer";
    });
  };
}
// https://astro.build/config
export default defineConfig({
  site: "https://zoravar.eu",
  integrations: [sitemap(), mdx()],
  i18n: {
    locales: ["en", "de"],
    defaultLocale: "en",
    routing: {
      prefixDefaultLocale: true,
    },
  },
  prefetch: true,
  markdown: {
    rehypePlugins: [externalLinks],
  },
});

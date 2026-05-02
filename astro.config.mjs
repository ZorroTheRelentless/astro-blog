// @ts-check
import { defineConfig } from 'astro/config';

import mdx from '@astrojs/mdx';

// https://astro.build/config
export default defineConfig({
  integrations: [mdx()],
  i18n: {
    locales: ["en", "de"],
    defaultLocale: "en",
    routing: {

      prefixDefaultLocale: true,
      redirectToDefaultLocale: true,
    },
  },
  prefetch: true
});

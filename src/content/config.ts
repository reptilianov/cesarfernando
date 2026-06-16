import { defineCollection, z } from 'astro:content';

const postCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.date(),
    updated: z.date().optional(),
    slug: z.string().optional(),
    translation_key: z.string().optional(),
    lang: z.enum(['es', 'en']).default('en'),
    tags: z.array(z.string()).default([]),
    draft: z.boolean().default(false),
    image: z.string().optional(),
    summary: z.string().optional(),
  }),
});

const sobreCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    lang: z.enum(['es', 'en']).default('en'),
    name: z.string(),
    image: z.string().optional(),
  }),
});

export const collections = {
  cuaderno: postCollection,
  escritura: postCollection,
  dibujos: postCollection,
  rasgunos: postCollection,
  proceso: postCollection,
  sobre: sobreCollection,
};

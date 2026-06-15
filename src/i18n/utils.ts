import { es } from './es';
import { en } from './en';

const translations = { es, en } as const;
type Locale = keyof typeof translations;
type TranslationKey = keyof typeof es;

export function useTranslations(locale: string) {
  const t = (key: TranslationKey): string => {
    const dict = translations[locale as Locale] || translations.en;
    return (dict as Record<string, string>)[key] || (translations.en as Record<string, string>)[key] || String(key);
  };
  return { t, locale: locale as Locale };
}

export function getLocalizedEntry(entries: any[], locale: string) {
  const match = entries.find((e: any) => e.data.lang === locale);
  return match || entries.find((e: any) => e.data.lang === 'en') || entries[0];
}

# SeoulMate v2.0 — Záznam architektonických rozhodnutí (ADR / Decisions)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 3. listopadu 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Záznamy klíčových rozhodnutí (Architecture Decision Records)

### ADR-01: Volba Drift SQLite pro Local-First jádro
- **Kontext:** Potřeba 100% offline čtení a zápisu, okamžité odezvy v metru a podpory reaktivních dotazů.
- **Rozhodnutí:** Použít knihovnu `drift` se SQLite.
- **Důsledek:** UI nečte ze sítě; veškerá data jsou nejprve bezpečně v lokální SQLite databázi na zařízení.

### ADR-02: Odstranění / zákaz Firebase Storage a přechod na lokální Vault
- **Kontext:** Firebase Cloud Storage vyžaduje tarif Blaze s povinnou platební kartou (dle [oficiálních podmínek Firebase](https://firebase.google.com/docs/storage/faqs-storage-changes-announced-sept-2024)), což porušuje Zero-Cost Gate.
- **Rozhodnutí:** `firebase_storage` odstranit nebo zakázat. Všechny doklady (PDF/obrázky) ukládat 100% lokálně s AES-256 šifrováním a manuálním exportem/importem.
- **Důsledek:** 0 Kč náklady, maximální soukromí a nezávislost na cloudovém úložišti souborů.

### ADR-03: On-Device Google ML Kit pro korejské OCR
- **Kontext:** Potřeba rozpoznávat Hangul texty v restauracích a na účtenkách bez internetu a bez poplatků za cloudová Vision API.
- **Rozhodnutí:** Použít balíček `google_mlkit_text_recognition` (Apache-2.0) s on-device korejským modelem.
- **Důsledek:** Běží lokálně na telefonu, 0 Kč, nulový přenos citlivých fotek přes internet.

### ADR-04: Outbox Pattern pro asynchronní replikaci do Firestore
- **Kontext:** Potřeba sdílet změny mezi 4 přáteli při zachování přísných limitů bezplatného Spark plánu (50k čtení/den).
- **Rozhodnutí:** Lokální změny zapisovat do tabulky `sync_outbox` a odesílat v dávkách (`WriteBatch`) pouze při aktivním spojení.
- **Důsledek:** Spotřeba Firestore operací klesne pod 1 % bezplatného limitu.

### ADR-05: Desktop jako sekundární P2 companion
- **Kontext:** Omezená kapacita a blížící se termín cesty.
- **Rozhodnutí:** Vývoj 100% soustředit na mobilní platformy (Android + iOS). Desktop (Windows/macOS) odložit na P2.
- **Důsledek:** Rychlejší dokončení stabilní mobilní aplikace použitelné v Koreji.

### ADR-06: Vizuální směr SeoulMate v2.0
- **Kontext:** Původní Dancheong červeno-modro-zlatá paleta neodpovídá schválenému směru produktu.
- **Rozhodnutí:** Použít moderní Korean + lightly playful design: krémový základ, inkoustově modrá primary, soft blue pro Dream, sage pro Adventure, peach/muted pink pro Memories a jemný dark blue-gray dark mode.
- **Důsledek:** `09_DESIGN_SYSTEM.md` je jediný závazný zdroj barevných tokenů a UI pravidel.

### ADR-07: Bomi je finální Haechi SeoulMate
- **Kontext:** Bylo testováno více vizuálních konceptů maskota.
- **Rozhodnutí:** Finálním maskotem je Bomi: měkký růžový Haechi s krémovým bříškem, modrozelenými rohy/detaily, malými růžovými křídly a růžovo-teal pruhovaným ocasem. Bomi je klidný, laskavý a podporující.
- **Důsledek:** Obecné nebo alternativní Haechi návrhy se nesmí používat jako produkční reference. Závazný popis je v `10_HAECHI_GUIDE.md`.

### ADR-08: Bomi má střední vizuální přítomnost
- **Kontext:** Maskot má dodat osobnost, ale nesmí rušit praktickou cestovní aplikaci.
- **Rozhodnutí:** Bomi se používá hlavně na Home, onboardingu, empty states, achievements a kontextových momentech. Emergency, Show to Local, mapa a husté formuláře dávají přednost informaci před ilustrací.
- **Důsledek:** Bomi není permanentní overlay ani dominantní dekorace každé obrazovky.

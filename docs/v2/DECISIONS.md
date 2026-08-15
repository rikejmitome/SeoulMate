# SeoulMate v2.0 — Záznam architektonických rozhodnutí (ADR / Decisions)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
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

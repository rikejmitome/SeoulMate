# SeoulMate v2.0 — Offline strategie a správa balíčků (Offline Strategy)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Synchronizace:** [14_SYNC_AND_CONFLICTS.md](14_SYNC_AND_CONFLICTS.md)

---

## 1. Local-First pilíře a offline garance

1. **Všechna data primárně v telefonu:** Veškerý obsah (itinerář, místa, fráze, jídla, nouzové kontakty, doklady) je uložen lokálně v Drift SQLite databázi a lokálních souborech.
2. **Nulová závislost na signálu pro čtení:** Žádná obrazovka nečeká na síťovou odpověď, aby mohla zobrazit obsah.
3. **Okamžitý lokální zápis:** Každá akce uživatele je okamžitě uložena do SQLite a zařazena do outbox fronty.

---

## 2. Struktura a manifest Offline Trip Packu

Před odletem (nebo při dostupnosti Wi-Fi) aplikace stáhne a zvaliduje ucelený **Offline Trip Pack**:

| Součást balíčku | Datový typ | Přibližná velikost | Offline dostupnost |
|---|---|---|---|
| **Korejské fráze & Audio** | JSON + AAC komprimované audio | ~15 MB | 100% Offline |
| **Food Guide & Fotografie jídel** | JSON + optimalizované WebP fotky | ~25 MB | 100% Offline |
| **Survival Guide & Metro data** | JSON + SVG schémata | ~5 MB | 100% Offline |
| **Nouzová data & Ambasáda** | JSON | < 1 MB | 100% Offline |
| **Uložená místa a trasy** | Drift SQLite | < 5 MB | 100% Offline |
| **Travel Vault doklady (PDF/PNG)** | Zašifrované lokální soubory | ~10–30 MB | 100% Offline |
| **Celkem Offline Pack** | — | **~50–80 MB** | **100% Offline** |

### Manifest balíčku (`manifest.json`):
Každý balíček obsahuje manifest s informacemi:
- `packageVersion`: Verze datového balíčku.
- `generatedAt`: Datum vygenerování balíčku.
- `itemsCount`: Počet položek v jednotlivých kategoriích.
- `totalSizeBytes`: Celková velikost.
- `checksumSha256`: Kontrolní součet integrity.
- `status`: `READY`, `DOWNLOADING`, `CORRUPTED`, `OUTDATED`.

---

## 3. Strategie při vyčerpání úložného prostoru a ochrana integrity

Pokud má zařízení méně než **50 MB** volného místa na disku:
1. **Ochrana kritických dat:** Databáze SQLite (itinerář, výdaje, nouzové kontakty) a šifrované doklady ve Vaultu (letenky) jsou chráněny před promazáním.
2. **Bezpečné čištění dočasných dat (Cache Eviction):** Aplikace nabídne bezpečné promazání mezipaměti miniatur fotografií a dočasných náhledů z kamery (`/cache/thumbnails/*`), které lze kdykoliv regenerovat z originálů.
3. **Varování uživatele:** Aplikace zobrazí srozumitelné upozornění bez pádu či poškození databáze.

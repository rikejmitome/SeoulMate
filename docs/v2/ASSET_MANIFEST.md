# SeoulMate v2.0 — Asset Manifest

**Verze:** 2.1  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 3. listopadu 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)

---

## 1. Cílová struktura

```text
assets/
├── branding/
│   ├── seoulmate-launcher-source.png
│   └── bomi-reference-master.png          # schválená master reference Bomiho
├── data/
│   ├── korean_phrases.json
│   ├── food_guide.json
│   ├── survival_guide.json
│   ├── emergency_info.json
│   └── bomi_dialogues.json
├── audio/
│   ├── phrases/
│   └── emergency/
├── images/
│   ├── bomi/
│   │   ├── bomi_welcome.webp
│   │   ├── bomi_preparation.webp
│   │   ├── bomi_cheer.webp
│   │   ├── bomi_warning.webp
│   │   ├── bomi_travel.webp
│   │   ├── bomi_rain.webp
│   │   ├── bomi_offline.webp
│   │   ├── bomi_sync_error.webp
│   │   ├── bomi_day_completed.webp
│   │   ├── bomi_achievement.webp
│   │   ├── bomi_homecoming.webp
│   │   └── bomi_empty.webp
│   ├── foods/
│   ├── places/
│   ├── illustrations/
│   ├── patterns/
│   └── icons/
└── fonts/
    ├── NotoSansKR/
    └── optional-latin-font/
```

---

## 2. Bomi asset rules

- používat pouze podobu definovanou v [10_HAECHI_GUIDE.md](10_HAECHI_GUIDE.md);
- master reference se nesmí automaticky přegenerovat;
- nové pózy musí zachovat siluetu, barvy a proporce;
- assety exportovat s transparentním pozadím, pokud obrazovka nevyžaduje ilustraci prostředí;
- preferovat WebP/PNG podle potřeby kvality/transparency;
- před přidáním ověřit vizuálně v light i dark UI;
- source prompt/provenance evidovat v doprovodném metadata souboru nebo komentáři manifestu.

---

## 3. Design asset rules

### Korean patterns
- jednoduché geometrie, hanok inspirace, vlny/oblouky;
- nízký kontrast;
- nesmí obsahovat náhodný Hangul.

### Icons
- běžné: line-art;
- důležité: plnější rounded varianty;
- SVG, pokud platformní/tooling omezení nevyžaduje raster.

### Photos
- realistické;
- lehce teplá korekce;
- optimalizované rozměry;
- známý zdroj a distribuční oprávnění.

---

## 4. Stav master reference

Schválená master reference Bomiho existuje mimo repozitář jako finální konverzační designový asset. Do repozitáře musí být vložena pod:

`assets/branding/bomi-reference-master.png`

Dokud soubor není fyzicky přidán, platí [10_HAECHI_GUIDE.md](10_HAECHI_GUIDE.md) jako textový source of truth a implementace nesmí improvizovat jinou podobu.

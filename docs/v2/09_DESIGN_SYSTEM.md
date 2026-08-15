# SeoulMate v2.0 — Design Systém (Design System)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Vizuální směr a designové principy

- **Korean Modern Heritage:** Spojení čistého moderního mobilního designu s tradičními korejskými barvami (paleta Dancheong, Hanok textury, Seoul sky).
- **Klidný a přehledný:** Žádný vizuální šum, dostatek bílého prostoru, jasná informační hierarchie.
- **Vysoká čitelnost v terénu:** Silný kontrast, optimalizované zobrazení Hangulu a velkých tlačítek.

---

## 2. Barevná paleta a sémantické tokeny

```text
┌───────────────────────────┬─────────────┬─────────────────────────────────┐
│ Token                     │ Hex kód     │ Význam a použití                │
├───────────────────────────┼─────────────┼─────────────────────────────────┤
│ color-primary-red         │ #D32F2F     │ Dancheong červená (akcenty, P0) │
│ color-primary-blue        │ #1976D2     │ Seoul Sky modrá (hlavní akce)   │
│ color-accent-gold         │ #FBC02D     │ Gingko žlutá (Haechi, hvězdy)   │
│ color-surface-hanok       │ #F9F7F2     │ Hanok papír (světlé pozadí)     │
│ color-surface-card        │ #FFFFFF     │ Karta na světlém pozadí         │
│ color-text-main           │ #1A1A1A     │ Hlavní text (kontrast > 12:1)   │
│ color-text-secondary      │ #5F6368     │ Doplňkový text a popisky        │
│ color-status-emergency    │ #C62828     │ Nouzový stav / varování         │
│ color-status-success      │ #2E7D32     │ Splněno / Synchronizováno       │
│ color-status-warning      │ #EF6C00     │ Alergeny / Časový konflikt      │
└───────────────────────────┴─────────────┴─────────────────────────────────┘
```

---

## 3. Typografie a fonty

Aplikace používá pro latinku i korejštinu písmo **Pretendard** (SIL Open Font License 1.1) nebo **Noto Sans KR**:

| Styl | Velikost (sp) | Řez (Weight) | Použití |
|---|---|---|---|
| **Display Large** | 32 | Bold (700) | Čísla dnů v itineráři, Show to Local Hangul |
| **Headline Medium** | 22 | SemiBold (600) | Názvy obrazovek, hlavní karta „Co teď?“ |
| **Title Medium** | 16 | SemiBold (600) | Názvy aktivit, míst a frází |
| **Body Medium** | 14 | Regular (400) | Běžný text, popisy míst a jídla |
| **Label Small** | 12 | Medium (500) | Badge stavů, časové značky, štítky |

---

## 4. Spacing, Radius a Elevation

- **Základní jednotka (Grid):** 4 dp (škála 4, 8, 12, 16, 24, 32, 48 dp).
- **Okraje obrazovek (Screen Padding):** 16 dp (mobil) / 24 dp (tablet).
- **Border Radius:**
  - Karty a modální okna: `16 dp`
  - Tlačítka a chipy: `12 dp`
  - Miniatury fotek a avatarů: `8 dp` / Plný kruh (`50 %`)
- **Stíny (Elevation):** Jemné rozptýlené stíny (`blurRadius: 8, spreadRadius: 0, color: Colors.black.withOpacity(0.06)`).

---

## 5. Komponentový katalog a stavy

Každá komponenta musí mít nadefinované stavy:
1. **Default / Enabled**
2. **Pressed / Active** (mikroanimace zmenšení měřítka na 0.98)
3. **Disabled** (50% krytí)
4. **Loading / Skeleton** (pulzující šedé bloky Hanok surface)
5. **Offline Indicator** (malý diskrétní štítek bez blokování UI)

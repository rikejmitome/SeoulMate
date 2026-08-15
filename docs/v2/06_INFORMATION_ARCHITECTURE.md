# SeoulMate v2.0 — Informační architektura (Information Architecture)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Katalog obrazovek:** [07_SCREEN_CATALOG.md](07_SCREEN_CATALOG.md)

---

## 1. Hlavní mobilní navigace (Bottom Navigation Bar)

Mobilní rozhraní využívá spodní navigační lištu s 5 hlavními záložkami pro snadné ovládání jednou rukou:

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        SEOULMATE MOBILE SHELL                          │
├───────────┬──────────────┬──────────────┬──────────────┬───────────────┤
│  1. HOME  │   2. PLAN    │  3. PLACES   │ 4. COMPANION │  5. TRIP HUB  │
│ (Co teď?) │ (Itinerář)   │ (Místa/Mapa) │ (Jazyk/Food) │ (Vault/Budget)│
└───────────┴──────────────┴──────────────┴──────────────┴───────────────┘
```

Rychlé globální vstupy:
- **Emergency Button:** Červená ikona štítu v pravém horním rohu na každé obrazovce ([07_SCREEN_CATALOG.md#scr-025](07_SCREEN_CATALOG.md)).
- **Home Base / Taxi Card Quick Action:** Rychlé tlačítko pro zobrazení korejské adresy hotelu.
- **Sync Status Indicator:** Ikona indikující stav synchronizace.

---

## 2. Stromová struktura modulů a obrazovek

```text
SeoulMate
├── 1. Home
│   ├── Adaptivní karta "Co teď?"
│   ├── Rychlé karty (Taxi Card, Hotel Card, Dnešní program, Počasí)
│   ├── Haechi zpráva dne
│   └── Readiness widget (před cestou) / Kronika dne (po návratu)
├── 2. Plan (Itinerář)
│   ├── Denní časová osa (Timeline dnů D1 až D14)
│   ├── Detail dne & Správa aktivit
│   ├── Detekce časových konfliktů & Návrhy Smart Itinerary
│   └── Propojení s Místy a Vault doklady
├── 3. Places (Místa & Mapa)
│   ├── Seznam a kategorie míst (Soul, Busan, Jeju...)
│   ├── Skupinové hlasování (Upvote / Downvote 4 přátel)
│   ├── Detail místa (Korejský název, otevírací doba, tipy, externí mapa)
│   ├── Online mapa & Offline Map Lite
│   └── Trip Inbox (Sběr odkazů a převod na místa)
├── 4. Companion (Korejský společník)
│   ├── Korean Phrases (Fráze, česká fonetika, audio)
│   ├── Food Guide (Jídla, pálivost, alergeny, varování)
│   ├── Survival Guide (Metro, T-money, etiketa, letiště)
│   ├── Camera Companion (On-device OCR Hangulu a překlad)
│   └── Show to Local & Rychlé karty
├── 5. Trip Hub (Nástroje a správa)
│   ├── Travel Vault (Bezpečné lokální šifrované PDF letenek a hotelů)
│   ├── Budget & Expenses (Výdaje, KRW split, OCR účtenek, vyrovnání)
│   ├── Checklist & Readiness Center (Příprava, balení, doklady)
│   ├── Group Decision Center (Nerozhodná hlasování a volby)
│   ├── Memories & PDF Trip Book (Kronika, fotky, generování fotoknihy)
│   ├── Záloha a obnova (Šifrovaný ZIP balíček)
│   ├── Sync Center & Outbox (Diagnostika synchronizace)
│   └── Nastavení tripu & 4 členové
└── 6. Emergency Center (Globální rychlý přístup)
    ├── Tísňová čísla (112, 119, 1330, Ambasáda ČR)
    ├── Taxi / Home Base nouzová karta
    └── Zdravotní údaje a kontakty 4 cestovatelů
```

---

## 3. Zásady desktopové adaptace (Priorita P2)

V budoucí fázi P2 pro Windows a macOS:
- Spodní navigační lišta se transformuje na postranní navigační panel (`NavigationRail` / `Sidebar`).
- Rozvržení obsahu využije vícesloupcový layout.
- **Zákaz desktop-only funkcí:** Všechna data, modely i schopnosti zůstávají 100% identické s mobilní verzí.

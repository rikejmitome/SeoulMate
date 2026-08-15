# SeoulMate v2.0 — Katalog obrazovek (Screen Catalog)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**UX specifikace:** [08_UX_SPECIFICATION.md](08_UX_SPECIFICATION.md)

---

## 1. Souhrnný přehled obrazovek

| Screen ID | Název obrazovky | Modul | Priorita | Primární cíl |
|---|---|---|---|---|
| **SCR-001** | Splash & Auth Gate | Auth | P0 | Ověření lokální session a přesměrování |
| **SCR-002** | Login & Register | Auth | P0 | Přihlášení / registrace e-mailem a heslem |
| **SCR-003** | Adaptive Home | Home | P0/P1 | Zobrazení „Co teď?“, rychlých karet a Haechiho |
| **SCR-004** | Trip Selector & Form | Trip | P0 | Seznam soukromých tripů a vytvoření nového |
| **SCR-005** | Trip Members & Roles | Trip | P0 | Správa 4 přátel, avatarů a preferencí |
| **SCR-006** | Itinerary Timeline | Plan | P0 | Přehled dnů cesty a časová osa |
| **SCR-007** | Trip Day Detail | Plan | P0 | Detail konkrétního dne a seznam aktivit |
| **SCR-008** | Activity Form | Plan | P0 | Vytvoření a úprava aktivity s časy a místem |
| **SCR-009** | Places List & Filter | Places | P0 | Seznam uložených míst s hlasováním 4 přátel |
| **SCR-010** | Place Detail Screen | Places | P0 | Detail místa, korejský název, otevírací doba, mapa |
| **SCR-011** | Place Create / Edit | Places | P0 | Formulář pro přidání nového místa |
| **SCR-012** | Trip Inbox | Places | P1 | Sběr nezařazených odkazů a screenshotů |
| **SCR-013** | Korean Phrases Catalog | Companion | P0 | Fráze, kategorie, česká fonetika, audio |
| **SCR-014** | Food Guide & Allergens | Companion | P0 | Encyklopedie jídel, pálivost, alergeny |
| **SCR-015** | Camera Companion (OCR) | Companion | P1 | Snímání kamery / fotky a rozpoznání Hangulu |
| **SCR-016** | Show to Local & Quick Cards | Companion | P1 | Celoobrazovkový Hangul text s vysokým jasem |
| **SCR-017** | Travel Vault List | Trip Hub | P0 | Seznam offline dokladů (letenky, vouchery) |
| **SCR-018** | Document Viewer | Trip Hub | P0 | Bezpečné zobrazení lokálního PDF dokladu |
| **SCR-019** | Budget Overview & Split | Trip Hub | P0 | Přehled výdajů v KRW, split na 4, dluhy |
| **SCR-020** | Expense Form & Receipt OCR | Trip Hub | P0/P1 | Záznam výdaje s vytěžením účtenky |
| **SCR-021** | Checklist & Readiness | Trip Hub | P0 | Úkoly před cestou a procento připravenosti |
| **SCR-022** | Group Decision Center | Trip Hub | P1 | Řešení nerozhodných hlasování a sporných voleb |
| **SCR-023** | Memories & Daily Journal | Trip Hub | P0 | Denní kronika, zápisky a fotky |
| **SCR-024** | PDF Trip Book Generator | Trip Hub | P1 | Náhled a mobilní generování tisknutelného PDF |
| **SCR-025** | Emergency Center | Emergency | P0 | Nouzová čísla, Home Base karta, zdravotní data |
| **SCR-026** | Sync Center & Outbox | Settings | P0 | Diagnostika synchronizace a řešení stavů |

---

## 2. Detailní specifikace klíčových obrazovek

### SCR-003: Adaptive Home („Co teď?“)
- **Vstupní cesty:** Výchozí záložka po spuštění aplikace.
- **Klíčové komponenty:**
  - *Hero Action Card:* Dominantní karta s doporučením („Odchod na letiště za 25 minut“ / „Zkontrolovat hotelové rezervace“).
  - *Context Mini-Cards:* Taxi Card, Dnešní program, Počasí, Readiness status.
  - *Haechi Floating Mascot:* Krátká situativní zpráva a povzbuzení.
- **Stavy:**
  - *Loading:* Skeleton animace karet (max 100 ms při čtení z Drift DB).
  - *Empty (žádný trip):* Výzva k vytvoření tripu nebo zadání kódu.
  - *Offline:* Všechny karty se načtou z lokální DB, v rohu svítí jemný offline badge.

### SCR-016: Show to Local & Rychlé karty
- **Vstupní cesty:** Otevření z Home, Korean Companion, Food Guide nebo Emergency.
- **Klíčové komponenty:**
  - Obrovský, vysoce kontrastní korejský text (velikost písma 32–48 sp).
  - Menší český význam pod textem pro uživatele.
  - Tlačítko „Max Brightness“ (dočasně zvýší jas displeje na 100 %).
  - Tlačítko „Play Audio“ (pokud je dostupné namluvené korejské audio).
- **Stavy:**
  - *Offline:* 100% funkční offline (všechny texty a audio jsou uloženy v lokálním balíčku).

### SCR-025: Emergency Center
- **Vstupní cesty:** Červené tlačítko štítu v horní liště na jakékoliv obrazovce.
- **Klíčové komponenty:**
  - Rychlé volání 112 (Policie), 119 (Hasiči/Záchranka), 1330 (Turistická linka v angličtině).
  - Tlačítko „Ukázat adresu ubytování v korejštině“ (Home Base Taxi Card).
  - Karty 4 cestovatelů: jméno v pase, krevní skupina, závažné alergie, kontakt na blízké v ČR.
- **Stavy:**
  - *Offline:* 100% lokální data s nulovou latencí.

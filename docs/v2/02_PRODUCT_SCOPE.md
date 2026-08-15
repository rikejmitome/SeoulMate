# SeoulMate v2.0 — Rozsah produktu a priority (Product Scope)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Požadavky:** [03_PRD.md](03_PRD.md)

---

## 1. Dělení prioritních úrovní

```text
┌────────────────────────────────────────────────────────────────────────┐
│ P0: Must-Have Cestovní Jádro                                          │
│ Trip, 4 členové, Home Base, Itinerář, Místa & Hlasování, Checklist,   │
│ Vault (Lokální šifrované doklady), Korean Companion, Food Guide,       │
│ Survival Guide & Doprava, Emergency Center, Budget & KRW Split,        │
│ Offline Trip Pack, Sync Center, Základní Memories, Záloha & Obnova     │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
┌──────────────────────────────────▼─────────────────────────────────────┐
│ P1: Chytré Propojení pro v2.0                                          │
│ Adaptivní "Co teď?", Trip Inbox, Group Decision Center,                │
│ Camera Companion (On-device OCR a lokální překlad), Rychlé karty,      │
│ OCR účtenek, Smart Itinerary návrhy, Online mapa & Offline Map Lite,   │
│ Počasí Open-Meteo, PDF Trip Book, Plný Haechi model, Statistiky        │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
┌──────────────────────────────────▼─────────────────────────────────────┐
│ P2: Odložené po Mobilním Vydání                                        │
│ Desktop Companion (Windows/macOS), Vektorové offline výřezy mapy,      │
│ Živá tranzitní data, Pokročilé mikromotion animace                     │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Podrobný rozpad modulů podle priorit

### 2.1 P0 — Kritické jádro pro cestovní použitelnost (Must-Have)
- **Trip & Členové (`REQ-TRIP-001..002`):** Vytvoření soukromého tripu pro 4 přátele, správa členů, časové pásmo, výchozí a sekundární měna.
- **Home Base (`REQ-TRIP-003`):** Uložení hotelu s korejskou adresou, kontakty, GPS souřadnicemi a offline přístupem.
- **Itinerář & Dny (`REQ-PLAN-001..002`, `REQ-PLAN-005`):** Správa dnů a aktivit, přiřazení míst, časů a účastníků.
- **Places & Skupinové hlasování (`REQ-PLC-001..002`, `REQ-PLC-004`):** Ukládání bodů zájmu, korejské názvy, hlasování 4 členů s okamžitým přepočtem pořadí, externí mapy.
- **Checklist & Readiness Center (`REQ-CHK-001..002`):** Společné a osobní úkoly, 4 úrovně připravenosti.
- **Travel Vault (`REQ-VLT-001..003`):** Bezpečné lokální ukládání PDF a obrázků dokladů s AES-256 šifrováním bez nutnosti cloudového úložiště.
- **Korean Companion & Survival Guide (`REQ-KOR-001`, `REQ-SRV-001`):** Statický balíček frází s českou fonetikou, audiem, historií a praktický průvodce dopravou, metrem a T-money.
- **Food Guide (`REQ-KOR-002`):** Encyklopedie korejských jídel, pálivost, složení, alergeny a varování před skrytými složkami.
- **Emergency Center (`REQ-EMG-001..003`):** Nouzová čísla (112, 119), adresa Home Base pro taxi/policii, zdravotní záznamy 4 členů.
- **Budget & Výdaje (`REQ-BDG-001..002`):** Evidence výdajů v KRW a CZK/EUR, plátce, rovný split 1/4, přehled dluhů a vyrovnání.
- **Offline Trip Pack & Sync Center (`REQ-OFF-001..003`):** Integrovaný lokální balíček a Drift SQLite DB s Outbox frontou do Firestore.
- **Memories & Záloha (`REQ-MEM-001..002`, `REQ-BAK-001`):** Denní záznamy, fotky v lokálním albu, ZIP export a obnova na novém zařízení.

### 2.2 P1 — Silně doporučená vylepšení pro v2.0
- **Adaptivní „Co teď?“ (`REQ-HOME-001..002`):** Dominantní situační akční karta podle fáze dne a nejbližšího programu.
- **Trip Inbox (`REQ-INB-001..002`):** Sběrné místo pro odkazy, screenshoty a poznámky s konverzí na Místo/Aktivitu/Výdaj.
- **Group Decision Center (`REQ-PLC-003`):** Centrum pro nerozhodná hlasování, sporné výdaje a změny plánu.
- **Camera Companion s OCR a překladem (`REQ-CAM-001..003`):** On-device rozpoznání korejského textu přes Google ML Kit s lokálním překladem.
- **Rychlé karty a Show to Local (`REQ-CRD-001`, `REQ-KOR-003`):** Celoobrazovkové korejské kartičky pro taxikáře (Home Base), hotel, alergie a nouzi.
- **OCR účtenek (`REQ-BDG-003`):** Automatické předvyplnění formuláře výdaje z fotky účtenky.
- **Smart Itinerary návrhy (`REQ-PLAN-003..004`):** Pravidlové vysvětlitelné návrhy řazení aktivit s možností Undo.
- **Mapy & Počasí (`REQ-MAP-001`, `REQ-WTH-001`):** Online mapa, Offline Map Lite a předpověď z Open-Meteo s bezpečným fallbackem.
- **PDF Trip Book & Statistiky (`REQ-MEM-003..004`):** Tvorba tisknutelného PDF fotodeníku a přehled achievementů.
- **Haechi Průvodce (`REQ-HCH-001`):** Kompletní pravidlový model 11 stavů maskota.

### 2.3 P2 — Odložené směry (Až po stabilizaci mobilní verze)
- **Windows a macOS companion:** Desktopová verze přizpůsobená pro klávesnici, myš a velký monitor.
- **Vektorový offline výřez mapy:** Lokální vektorové dlaždice Soul/Busan/Jeju.
- **Živá tranzitní data:** Napojení na bezplatná live API korejské hromadné dopravy.

---

## 3. Platformní matice úplnosti

| Modul / Funkce | Android (Mobil) | iOS (Mobil) | Windows (P2) | macOS (P2) | Exkluzivní pro Desktop? |
|---|---|---|---|---|---|
| Plánování a itinerář | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| Správa míst a hlasování | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| Travel Vault (Doklady) | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| Emergency Center | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| Korean & Food Guide | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| Camera OCR & Překlad | ANO (Živá kamera) | ANO (Živá kamera)| ANO (Ze souboru) | ANO (Ze souboru)| **NE** |
| Budget & OCR účtenek | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| PDF Trip Book tvorba | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |
| Záloha, export a obnova | ANO (Plné) | ANO (Plné) | ANO (Parita) | ANO (Parita) | **NE** |

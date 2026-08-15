# SeoulMate v2.0 — Přístupnost a lokalizace (Accessibility & Localization)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Design systém:** [09_DESIGN_SYSTEM.md](09_DESIGN_SYSTEM.md)

---

## 1. Pravidla přístupnosti (A11y — WCAG 2.1 AA)

- **Dynamické zvětšení textu (Text Scaling):** Celé uživatelské rozhraní musí korektně podporovat systémové nastavení velikosti písma až do **150 %** (`MediaQuery.textScaler`). Žádný text nesmí být oříznut a nesmí dojít k chybě `RenderFlex overflow`.
- **Barevný kontrast:**
  - Běžný text (`body`): Minimální kontrast **4.5:1** vůči pozadí.
  - Velký text a nadpisy: Minimální kontrast **3:1**.
  - Show to Local režim: Kontrast minimálně **12:1** (černé písmo na bílém podkladu).
- **Dotykové plochy (Touch Targets):** Všechna tlačítka, ikony a ovládací prvky musí mít minimální rozměr **48 × 48 dp**.
- **Semantické popisky (Screen Readers):** Všechny obrázky a ikony mají vyplněný `Semantics` popisek v češtině (např. *„Tlačítko: Otevřít nouzové centrum“*).

---

## 2. Jazyková a lokalizační architektura

Aplikace funguje ve specifickém trojjazyčném ekosystému:
1. **Čeština (cs):** Hlavní jazyk uživatelského rozhraní, navigace, tlačítek a vysvětlivek.
2. **Korejština (ko / Hangul):** Jazyk reálného prostředí (názvy stanic metra, adresy hotelů pro taxikáře, originální názvy jídel a jídelních lístků).
3. **Angličtina (en):** Doplňkový jazyk mezinárodních letenek, standardní romanizace a mezinárodních tísňových linek.

### Správa lokalizačních řetězců
Všechny texty rozhraní jsou spravovány prostřednictvím standardního Flutter ARB systému:
- `lib/l10n/app_cs.arb` (Výchozí kompletní lokalizace)
- `lib/l10n/app_en.arb` (Záložní mezinárodní lokalizace)

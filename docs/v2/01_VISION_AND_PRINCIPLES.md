# SeoulMate v2.0 — Vize a produktové principy (Vision & Principles)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Problém a příležitost

Při společném cestování čtyř přátel do Jižní Koreje s odlišným jazykem, písmem (Hangul) a kulturou bývají klíčové informace roztříštěné:
- Letenky a ubytování v e-mailech a PDF souborech;
- Tipy na místa a restaurace v chatech a screenshotech;
- Rozpočet v nepřehledných tabulkách;
- Jazyková bariéra v terénu při objednávání jídla, jízdě taxíkem či nouzových situacích;
- Ztráta internetového připojení v podzemní dráze nebo při výpadku roamingu;
- Neuspořádané vzpomínky a fotky po návratu.

**SeoulMate** spojuje všechny tyto potřeby do jednoho elegantního, soukromého a 100% spolehlivého cestovního společníka.

---

## 2. Produktová vize: Tři fáze jedné cesty

SeoulMate není pouhá utilita — provází skupinu celým životním cyklem cesty:

```text
       ┌───────────────┐        ┌───────────────────┐        ┌──────────────────┐
       │     DREAM     │  ───>  │     ADVENTURE     │  ───>  │     MEMORIES     │
       │  Před cestou  │        │   Během cesty     │        │   Po návratu     │
       └───────────────┘        └───────────────────┘        └──────────────────┘
        Společný plán,           Adaptivní "Co teď?",         Denní kronika,
        místa, hlasování,        Home Base, Taxi Card,        vybrané fotky,
        doklady a checklist      OCR, Emergency, výdaje       PDF Trip Book
```

1. **Dream (Příprava & Těšení se):** Společné plánování itineráře, ukládání míst, hlasování o aktivitách, kontrola připravenosti dokladů, studium korejských frází a jídla.
2. **Adventure (Život v terénu):** Okamžitá odpověď na otázku „Co teď?“, rychlé navigační karty na hotel/taxi, on-device překlad nápisů a jídelníčků, bezpečné offline doklady, nouzové centrum a férové rozpočítání výdajů.
3. **Memories (Uchování zážitků):** Společná denní kronika, statistiky, výběr fotografií a vygenerování krásného PDF Trip Booku přímo v mobilu.

---

## 3. Neměnné produktové principy

### Princip 1: Soukromá aplikace pro 4 rovnocenné přátele
SeoulMate není veřejná sociální síť ani komerční marketplace. Všichni 4 členové mají rovnocenná práva. Žádné reklamy, žádné veřejné profily ani zbytečná moderace.

### Princip 2: Mobil je 100% úplný primární produkt
Veškeré funkce (plánování, správa, offline provoz, rozpočet, export, záloha, obnova i tvorba Trip Booku) musí být kompletně a pohodlně realizovatelné na telefonech s **Androidem** a **iOS**. Žádný workflow nesmí vyžadovat počítač.

### Princip 3: Desktop je pouze sekundární companion (P2)
Verze pro Windows a macOS přijdou na řadu až po stabilizaci mobilní verze. Mohou nabídnout širší rozložení a klávesové zkratky pro pohodlné plánování u stolu, ale nesmí obsahovat jedinou exkluzivní funkci.

### Princip 4: Nulové provozní náklady (Zero-Cost Gate)
Žádná kritická funkce nesmí vyžadovat placený backend, API, platební kartu ani automatické účtování. Veškeré externí služby jsou pouze volitelné doplňky s bezpečným lokálním fallbackem.

### Princip 5: Local-First a Offline-First spolehlivost
Aplikace čte a zapisuje primárně do lokální SQLite databáze. Všechny klíčové funkce fungují v metru i při nulovém signálu. Cloud slouží pouze jako asynchronní synchronizační vrstva.

### Princip 6: Haechi jako emocionální a lokální průvodce
Haechi je maskotem a rádcem, který žije přímo v aplikaci a reaguje na situace pomocí lokálních pravidel a šablon (nikoliv placených cloudových chatbotů).

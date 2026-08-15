# SeoulMate v2.0 — UX a interakční specifikace (UX Specification)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Design systém:** [09_DESIGN_SYSTEM.md](09_DESIGN_SYSTEM.md)

---

## 1. Pravidla pro modul „Co teď?“ (Adaptive Home)

1. **Jedna dominantní akce:** Uživatel ve stresu na ulici nebo v metru nesmí luštit složité dashboardy. Na první pohled vidí právě jednu nejdůležitější kartu s jasným tlačítkem.
2. **Vysvětlitelná logika:** Každé doporučení má stručný důvod (např. *„Podle itineráře začíná prohlídka paláce za 45 minut. Doporučený odchod z hotelu za 15 minut.“*).
3. **Přímá akce bez proklikávání:** Tlačítko na kartě rovnou otevírá cílovou akci (navigační odkaz, doklad, kartu pro taxikáře).

---

## 2. Zásady ovládání jednou rukou (One-Handed Mobile UX)

- **Thumb Zone:** Všechny primární ovládací prvky (spodní navigace, potvrzovací tlačítka formulářů, spoušť kamery) musí být umístěny ve spodních 40 % obrazovky.
- **Minimální dotyková plocha:** Žádný interaktivní prvek nesmí mít dotykovou plochu menší než **48 × 48 dp**.
- **Gesta potažení:** Podpora potažení dolů pro zavření modálních dialogů; potažení do stran pro přepínání dnů v itineráři.

---

## 3. Chování ve stresových a offline situacích

### 3.1 Ztráta internetu (Offline Resilience)
- **Žádné blokující chybové dialogy:** Aplikace nikdy nezobrazí celoobrazovkovou chybu „Chybí připojení k internetu“.
- **Tichý přechod:** V rohu obrazovky se pouze rozsvítí decentní indikátor offline stavu a veškeré čtení i zápis pokračují plynule z lokální SQLite databáze.

### 3.2 Nouzová situace a jízda taxíkem v noci
- **Přístup do 2 vteřin:** Emergency Center a Taxi Card musí být dostupné maximálně na 1–2 klepnutí z libovolného místa aplikace.
- **Vysoký kontrast a automatický jas:** Režim Show to Local automaticky nastaví bílé pozadí s černým písmem Hangul a nabídne dočasné zvýšení jasu displeje na maximum pro snadnou čitelnost přes sklo taxíku.

---

## 4. Bezpečnostní komunikace alergenů a strojového překladu

- **Zřetelné označení strojového OCR a překladu:** Každý výstup z Camera Companion musí nést štítek: `🤖 Strojové rozpoznání (původní text: ...)`.
- **Alergenové varování:** U jídel a OCR detekce alergenů musí být trvale zobrazeno upozornění:
  > *„Automatická detekce alergenů má pouze informativní charakter a nenahrazuje přímé ověření u obsluhy. Pro jistotu ukažte obsluze kartičku z Food Guide.“*
- **Skryté složky:** Upozornění na skryté masové/rybí složky (rybí omáčka v kimchi, hovězí vývar v polévkách) musí být vizuálně zvýrazněno oranžovým varovným odznakem.

---

## 5. Tón textů (Tone of Voice) a mikrotexty

- **Čeština:** Přirozená, přátelská, stručná a věcná.
- **Korejská slova:** Vždy uvádět v kombinaci: Korejský zápis (Hangul) + Česká výslovnost v závorce (např. *Kamsahamnida [kamsahamnida] — Děkuji*).
- **Haechi:** Moudrý, pozitivní a povzbuzující společník, který mluví krátce a k věci (max 2 věty).

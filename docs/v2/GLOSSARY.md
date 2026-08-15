# SeoulMate v2.0 — Slovníček pojmů (Glossary)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Technické pojmy

- **Local-First:** Architektonický přístup, kde je lokální databáze (Drift SQLite) primárním zdrojem pravdy pro veškeré čtení i zápis, a cloud slouží výhradně k asynchronní replikaci.
- **Outbox Pattern:** Návrhový vzor, kdy se každá lokální změna nejprve zapíše do tabulky `sync_outbox` v rámci lokální transakce a následně ji background worker spolehlivě odešle do cloudu.
- **Drift:** Typově bezpečná SQLite knihovna pro Flutter/Dart umožňující reaktivní dotazy a offline perzistenci.
- **Spark Tier:** Bezplatný tarif platformy Google Firebase bez nutnosti vkládat platební kartu.
- **On-Device OCR:** Rozpoznávání optického textu probíhající přímo na procesoru mobilního telefonu bez odesílání snímků na vzdálené servery (Google ML Kit).
- **Show to Local:** Celoobrazovkový režim s velkým kontrastním korejským textem určený k ukázání místním obyvatelům (taxikář, číšník).

---

## 2. Cestovní a korejské pojmy

- **Hangul (한글):** Korejské fonetické písmo vytvořené králem Sedžongem Velikým v 15. století.
- **Haechi (해치):** Mýtické stvoření, tradiční symbol Soulu a ochránce před nebezpečím, který slouží jako maskot SeoulMate.
- **Home Base:** Primární ubytování tripu (hotel/apartmán) s korejskou adresou pro návrat v noci.
- **T-money:** Dobíjecí bezkontaktní dopravní karta používaná v korejském metru, autobusech a taxících.
- **Naver Map / KakaoMap:** Dominantní mapové a navigační služby v Jižní Koreji poskytující přesnější trasy než Google Maps.
- **KTX (Korea Train Express):** Korejský vysokorychlostní vlak spojující Soul s Busanem.
- **KRW (Korejský won - ₩):** Oficiální měna Jižní Koreje.

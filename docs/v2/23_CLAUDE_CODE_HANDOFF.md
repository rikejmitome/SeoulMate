# SeoulMate v2.0 — předávací zadání pro Claude Code

**Určeno pro:** Claude Code  
**Typ dokumentu:** kompletní vstupní briefing a pracovní smlouva  
**Nadřazený dokument:** `docs/v2/00_MASTER_PLAN.md`  
**Stav:** připraveno k použití po připojení skutečného repozitáře SeoulMate  
**Datum:** 27. července 2026  

---

## 1. Úvodní instrukce pro Claude Code

Pracuješ na projektu **SeoulMate v2.0**. Jde o soukromou Flutter aplikaci pro čtyři přátele cestující do Jižní Koreje.

Tvým úkolem není produkt znovu vymýšlet. Tvým úkolem je:

1. přečíst projektovou dokumentaci;
2. bezpečně auditovat existující SeoulMate v1.0;
3. navrhnout konkrétní migrační kroky odpovídající schválené vizi;
4. postupně implementovat v2.0;
5. testovat, dokumentovat a vytvářet malé kontrolovatelné commity;
6. minimalizovat práci vlastníka projektu;
7. nikdy neporušit nulové provozní náklady, soukromí, local-first architekturu ani prioritu mobilu.

Nezačínej přepisem projektu. Nejdříve zjisti skutečný stav repozitáře.

---

## 2. Hierarchie instrukcí

Dodržuj v tomto pořadí:

1. bezpečnostní a systémové instrukce prostředí;
2. kořenový `AGENTS.md` a `CLAUDE.md`;
3. `docs/v2/00_MASTER_PLAN.md`;
4. schválená rozhodnutí v `DECISIONS.md`;
5. relevantní specifikace funkce;
6. konkrétní zadání úkolu.

Pokud dokumenty odporují Master Planu:

- nehádej;
- rozpor zapiš;
- navrhni nejmenší bezpečné řešení;
- vyžádej rozhodnutí pouze tehdy, pokud by volba zásadně změnila produkt, data, náklady nebo rozsah.

Starší dokumentace v1.0 je referenční materiál, nikoli automaticky platná specifikace.

---

## 3. Produkt v jedné větě

SeoulMate je krásný, soukromý, local-first a offline-first cestovní companion, který čtyřem přátelům pomáhá připravit cestu do Koreje, zvládnout ji přímo na mobilu a po návratu vytvořit společnou kroniku — bez pravidelných provozních nákladů.

---

## 4. Tvrdé produktové podmínky

### 4.1 Primárně mobilní a úplný

- Android a iOS obsahují všechny funkce.
- Žádný workflow nesmí vyžadovat Windows nebo macOS.
- Mobil umožní plánování, správu dat, import, export, zálohu, obnovu i Trip Book.
- Mobilní UX má prioritu.

### 4.2 Desktop pouze jako companion

- Windows a macOS mohou použít stejné funkce v širším layoutu.
- Mohou přidat pohodlnější ovládání, nikoli nové schopnosti.
- Žádná desktop-only funkce není povolena.
- Desktop nesmí zpomalit hlavní mobilní release.

### 4.3 Pro čtyři soukromé uživatele

- žádné reklamy;
- žádná veřejná sociální síť;
- žádné veřejné profily;
- žádná moderace;
- rovnocenná oprávnění členů;
- data pouze uvnitř tripu.

### 4.4 Nulové provozní náklady

Nepřidávej nic, co:

- vyžaduje placený tarif;
- vyžaduje platební kartu pro základní funkci;
- může automaticky účtovat překročení;
- používá placené API jako kritickou závislost;
- ukládá neomezené fotografie do placeného cloudu;
- vytváří neomezený AI chat placený vlastníkem.

Každá externí služba musí mít:

- aktuálně ověřené oficiální podmínky;
- zdokumentovaný limit;
- timeout a error handling;
- cache, kde dává smysl;
- bezpečné chování po výpadku nebo vyčerpání limitu;
- lokální nebo ruční alternativu.

### 4.5 Local-first a offline-first

- UI čte z lokální databáze.
- Změny se zapisují lokálně jako první.
- Synchronizace probíhá na pozadí nebo na explicitní požadavek.
- Neúspěšné změny zůstávají ve frontě.
- Konflikty nesmí být skryté.
- Uživatel vidí stav synchronizace a offline dostupnosti.
- Kritické cestovní funkce fungují bez internetu.

---

## 5. Schválený funkční rozsah

Musíš zachovat nebo vybudovat:

### Jádro tripu

- soukromý trip;
- čtyři členové;
- termín, preference, měny a nastavení;
- Home Base;
- více budoucích soukromých tripů bez zbytečně složitého UI.

### Dream

- Trip Planner;
- Smart Itinerary s vysvětlitelnými návrhy;
- Places a hlasování;
- Trip Inbox;
- společný i osobní checklist;
- Readiness Center;
- Travel Vault;
- Group Decision Center;
- rozpočtová příprava;
- výukový obsah;
- Offline Trip Pack.

### Adventure

- adaptivní Home „Co teď?“;
- dnešní časová osa;
- mapy a otevření externí navigace;
- Home Base a rychlé karty;
- rezervace a offline dokumenty;
- Korean Companion;
- Food Guide;
- Survival Guide a doprava;
- Camera Companion;
- Show to Local;
- Emergency Center;
- Budget a OCR účtenek;
- Sync Center.

### Memories

- denní kronika;
- navštívená místa a dokončené aktivity;
- osobní a společné poznámky;
- vybrané fotografie a náhledy;
- achievementy a statistiky;
- automatická kostra deníku;
- PDF Trip Book;
- export, záloha a obnova.

### Haechi

- moderní vizuální průvodce;
- kontextové lokální šablony;
- stavy přípravy, cesty, upozornění, offline, chyby, úspěchu a vzpomínek;
- žádná nutná placená generativní AI.

Detailní chování vždy čerpej z Master Planu a následných specifikací.

---

## 6. Priority

### P0

- Android/iOS základ;
- trip, členové, Home Base;
- Home;
- itinerář;
- Places a hlasování;
- checklist a Readiness;
- Travel Vault;
- jazyk, jídlo, kultura a doprava;
- Emergency;
- Budget;
- Offline Trip Pack;
- Sync Center;
- základní Memories;
- export, záloha a obnova;
- design systém;
- testy a sestavitelný mobilní produkt.

### P1

- Trip Inbox;
- Decision Center;
- Camera Companion;
- Show to Local;
- OCR účtenek;
- chytré itinerářové návrhy;
- online mapa a Offline Map Lite;
- počasí;
- automatická kronika;
- Trip Book;
- pokročilý Haechi.

### P2

- Windows a macOS companion;
- legální pokročilý offline mapový podklad;
- stabilní bezplatná živá dopravní data;
- další bezpečné integrace;
- finální motion polish.

Nezačínej P2 před stabilním mobilním release candidate, pokud vlastník výslovně nezmění prioritu.

---

## 7. Cílová architektura

Výchozí směr:

- Flutter;
- Riverpod;
- GoRouter;
- Drift/SQLite;
- feature-based architektura;
- repository pattern tam, kde odděluje lokální, synchronizační a externí zdroje;
- verzovaný lokální obsah;
- bezpečné platformní úložiště;
- synchronizační fronta;
- stejné doménové služby pro mobil a desktop.

Existující Firebase Authentication a Cloud Firestore mohou zůstat pro malá strukturovaná data, pokud audit potvrdí:

- že už jsou správně implementovány;
- bezpečnostní pravidla;
- vhodné bezplatné limity;
- žádné automatické náklady;
- možnost fungovat bez sítě;
- možnost exportu a obnovy.

Nepoužívej cloudové souborové úložiště automaticky. Travel Vault a média musí být nejdříve lokální. Sdílené soubory řeš až samostatně, s bezpečným stavem lokální/sdílené/stažené.

Nevybírej nebo neměň hlavní knihovny před auditem `pubspec.yaml`, zdrojového kódu, platforem a testů.

---

## 8. Datový a synchronizační model

Pro každou sdílenou entitu zvaž:

- `id`;
- `tripId`;
- `createdAt`;
- `updatedAt`;
- `createdBy`;
- `updatedBy`;
- `revision`;
- `deletedAt` nebo tombstone;
- `syncStatus`.

Synchronizace musí být:

- local-first;
- idempotentní;
- opakovatelná;
- pozorovatelná;
- testovatelná bez reálného backendu;
- odolná proti restartu aplikace;
- bezpečná při konfliktu;
- kompatibilní s migracemi.

Nevytvářej „last write wins“ bez výslovného doménového rozhodnutí. Některé entity mohou používat slučování, jiné uživatelské potvrzení.

Soubory mají oddělená metadata a binární stav. Nikdy nepředstírej, že dokument je offline, pokud lokální soubor chybí.

---

## 9. Obsah a data

Fráze, jídlo, etiketa, doprava, nouzové informace a kurátorovaná místa nejsou hardcoded UI text.

Požaduj:

- verzované soubory;
- schéma;
- validační skript nebo test;
- stabilní ID;
- zdroj a datum kontroly;
- překlady;
- licenci assetů;
- možnost aktualizace.

Automatický překlad, OCR, alergenová detekce a itinerářové doporučení vždy jasně odliš od ověřeného SeoulMate obsahu.

---

## 10. UX a vizuální pravidla

Před rozsáhlým UI refaktorem musí existovat schválený:

- design systém;
- sada tokenů;
- navigační model;
- klíčové mobilní obrazovky;
- komponentový katalog;
- Haechi guide;
- asset manifest.

Každá důležitá obrazovka potřebuje:

- loading;
- empty;
- populated;
- error;
- offline;
- sync pending;
- velké písmo;
- přístupnost;
- tmavý a světlý režim, pokud jsou v dané fázi schváleny.

Desktop adaptuje stejné komponenty a funkce. Mobilní UI se nesmí jen bezmyšlenkovitě roztáhnout, ale desktopová adaptace nesmí změnit funkční paritu.

---

## 11. Bezpečnostní pravidla

- Nikdy nečti, nevypisuj ani necommituj tajné údaje.
- Nevkládej produkční klíče do zdrojového kódu.
- Používej `.env.example` nebo platformní bezpečnou konfiguraci bez hodnot.
- Neměň produkční cloud, data ani bezpečnostní pravidla bez oprávnění.
- Neodstraňuj uživatelská data bez ověřené zálohy a migračního testu.
- Logy nesmí obsahovat citlivé dokumenty, tokeny, adresy, zdravotní údaje ani celé OCR vstupy.
- Zachovej nesouvisející rozpracované změny.
- Nepoužívej destruktivní Git příkazy bez výslovného souhlasu.
- Před novým oprávněním platformy vysvětli důvod a přidej odmítnutý stav.

---

## 12. První úkol: audit v1.0

Po připojení k reálnému repozitáři nejdříve proveď pouze audit a stabilizační návrh. Neprováděj velký refaktor.

### 12.1 Zjisti

- strukturu repozitáře;
- aktivní větev, HEAD a stav pracovního stromu;
- existující `AGENTS.md`, `CLAUDE.md` a dokumentaci;
- Flutter a Dart verze;
- obsah `pubspec.yaml`;
- podporované platformy;
- architekturu a navigaci;
- stavový management;
- lokální databázi;
- Firebase a další služby;
- datové modely;
- implementované obrazovky;
- testy a CI;
- assety a licence;
- konfiguraci tajných údajů;
- známé TODO/FIXME;
- build chyby;
- technický dluh;
- možná místa provozních nákladů.

### 12.2 Spusť bezpečné kontroly

Použij příkazy odpovídající projektu, typicky:

- kontrolu prostředí Flutter;
- načtení závislostí;
- formátování pouze jako kontrolu nebo cílenou změnu;
- statickou analýzu;
- unit/widget testy;
- debug build Androidu;
- další platformní buildy pouze tam, kde je dostupné vhodné prostředí.

Neopravuj automaticky stovky nesouvisejících formátovacích změn před vytvořením baseline.

### 12.3 Vytvoř výstupy

1. `docs/v2/audit/REPOSITORY_AUDIT.md`
2. `docs/v2/audit/FEATURE_INVENTORY.md`
3. `docs/v2/audit/DEPENDENCY_AND_COST_AUDIT.md`
4. `docs/v2/audit/TEST_BASELINE.md`
5. `docs/v2/audit/MIGRATION_RECOMMENDATION.md`

Každou část klasifikuj:

- KEEP;
- REFINE;
- REFACTOR;
- REPLACE;
- REMOVE;
- NEW.

Uveď důkaz v souborech a testech, ne pouze dojem.

### 12.4 Po auditu zastav velké rozhodnutí

Před zásadní změnou architektury předlož:

- co lze zachovat;
- co je nutné změnit;
- pořadí migrace;
- rizika pro data;
- odhad relativní složitosti;
- první 5–10 malých implementačních úkolů.

---

## 13. Dokumentace, kterou máš pomoci vytvořit

Cílová sada:

- `00_MASTER_PLAN.md`
- `01_VISION_AND_PRINCIPLES.md`
- `02_PRODUCT_SCOPE.md`
- `03_PRD.md`
- `04_PERSONAS_AND_JOBS.md`
- `05_USER_FLOWS.md`
- `06_INFORMATION_ARCHITECTURE.md`
- `07_SCREEN_CATALOG.md`
- `08_UX_SPECIFICATION.md`
- `09_DESIGN_SYSTEM.md`
- `10_HAECHI_GUIDE.md`
- `11_CONTENT_STRATEGY.md`
- `12_TECHNICAL_ARCHITECTURE.md`
- `13_DATA_MODEL.md`
- `14_SYNC_AND_CONFLICTS.md`
- `15_OFFLINE_STRATEGY.md`
- `16_INTEGRATIONS_AND_DATA_SOURCES.md`
- `17_SECURITY_AND_PRIVACY.md`
- `18_ACCESSIBILITY_AND_LOCALIZATION.md`
- `19_TESTING_STRATEGY.md`
- `20_RELEASE_AND_DISTRIBUTION.md`
- `21_MIGRATION_V1_TO_V2.md`
- `22_CODEX_WORKFLOW.md`
- `23_CLAUDE_CODE_HANDOFF.md`
- `24_ACCEPTANCE_CRITERIA.md`
- `25_ROADMAP.md`
- `26_TASK_BACKLOG.md`
- `27_SETUP_FOR_BEGINNERS.md`
- `DECISIONS.md`
- kořenový `AGENTS.md`
- kořenový `CLAUDE.md`
- `SETUP.md`

Nevytvářej prázdné dokumenty pouze kvůli seznamu. Každý dokument má vzniknout, až pro něj existují ověřené vstupy, a musí být konzistentní s kódem.

---

## 14. Pracovní postup pro každý implementační úkol

### Před změnou

1. Přečti instrukce a relevantní specifikaci.
2. Zkontroluj pracovní strom.
3. Identifikuj uživatelské změny.
4. Napiš krátký plán.
5. Urči akceptační kritéria.
6. Urči testy a vizuální ověření.
7. Ověř Zero-Cost Gate pro nové závislosti.

### Během změny

1. Dělej nejmenší úplný vertikální řez.
2. Zachovej stávající chování mimo rozsah.
3. Piš testovatelnou doménovou logiku.
4. Přidej error/offline/loading stavy.
5. Průběžně spouštěj úzké testy.
6. Neprováděj „cleanup celého projektu“ mimo úkol.

### Po změně

1. Zformátuj změněné soubory.
2. Spusť analýzu.
3. Spusť relevantní testy.
4. Spusť širší sadu, pokud změna zasahuje sdílené jádro.
5. Proveď vizuální QA.
6. Aktualizuj dokumentaci.
7. Zkontroluj diff a tajné údaje.
8. Vytvoř malý smysluplný commit.
9. Push/PR proveď pouze při oprávnění.
10. Nahlas výsledek, testy, omezení a další bezpečný krok.

---

## 15. Git workflow

Doporučený model:

- jedna větev nebo worktree na uzavřený úkol;
- malé commity;
- conventional-style názvy, pokud je projekt používá;
- pull request s popisem změny a důkazem testů;
- CI na PR a hlavní větev;
- žádný automatický merge bez zelených kontrol a schváleného pravidla.

Před commitem zkontroluj:

- `git status`;
- diff;
- nové soubory;
- tajné údaje;
- generované soubory;
- změny závislostí;
- migrační dopady.

Pokud jsou v pracovním stromu cizí změny, nevracej je. Odděl svou práci nebo požádej o rozhodnutí.

---

## 16. Testovací očekávání

Minimální sada podle typu změny:

| Změna | Povinné ověření |
|---|---|
| Doménová logika | unit testy, hraniční případy |
| Databáze | migrační test, CRUD, rollback/recovery |
| Synchronizace | offline fronta, retry, idempotence, konflikt |
| UI komponenta | widget test, přístupnost, relevantní golden |
| Hlavní flow | integrační test |
| Externí služba | fake adapter, timeout, error, cached/offline stav |
| Import/export | round-trip, starší verze, poškozený vstup |
| OCR/překlad | chybné rozpoznání, ruční oprava, odmítnuté oprávnění |
| Budget | měny, zaokrouhlení, vlastní split |
| Release | analyze, test, platformní build |

Testy nesmí záviset na produkčních účtech nebo placených službách.

---

## 17. Definition of Done

Funkce je hotová pouze pokud:

- funguje na Androidu a iOS nebo je výslovně označena jako dočasně platformně blokovaná;
- mobilní verze je úplná;
- desktop nemá exkluzivní variantu;
- funguje v očekávaném offline scénáři;
- chyby jsou srozumitelné a obnovitelné;
- existují relevantní testy;
- analýza a testy procházejí;
- nejsou přidány náklady;
- nejsou přidány tajné údaje;
- dokumentace odpovídá;
- přístupnost byla zkontrolována;
- je znám stav datové migrace;
- změna má kontrolovatelný diff.

---

## 18. Co nesmíš udělat bez výslovného rozhodnutí

- zahodit existující v1.0 a začít znovu;
- změnit backend;
- migrovat produkční data;
- aktivovat placený tarif;
- přidat službu vyžadující kartu;
- odstranit uživatelská data;
- měnit účty, tajné údaje nebo store konfiguraci;
- hromadně přepisovat UI bez design systému;
- přidat veřejnou sociální funkci;
- vytvořit desktop-only feature;
- vydat aplikaci do obchodu;
- pushnout, mergovat nebo tagovat release bez potřebného oprávnění;
- označit automatický překlad nebo alergenovou detekci za ověřenou.

---

## 19. Jak komunikovat s vlastníkem

Vlastník je začátečník. Piš česky, jednoduše a bez předpokladu znalosti terminologie.

Když použiješ technický pojem:

- jednou větou vysvětli, co znamená;
- řekni, proč je relevantní;
- uveď, zda musí vlastník něco udělat.

V každém handoffu uveď:

1. co je hotové;
2. co se změnilo z pohledu aplikace;
3. jak bylo ověřeno;
4. zda existuje riziko nebo známé omezení;
5. zda je nutný zásah vlastníka;
6. jaký je doporučený další krok.

Nepožaduj ruční práci, kterou můžeš bezpečně provést sám. Naopak nepřebírej oprávnění k účtům, platbám, produkci nebo destruktivním operacím bez souhlasu.

---

## 20. Doporučený první prompt pro Claude Code

Následující blok lze použít po otevření skutečného repozitáře:

> Přečti nejdříve kořenový `AGENTS.md`, `CLAUDE.md`, `docs/v2/00_MASTER_PLAN.md` a `docs/v2/23_CLAUDE_CODE_HANDOFF.md`. Potom proveď pouze read-only audit současného SeoulMate v1.0 podle části „První úkol: audit v1.0“. Neměň zatím aplikační kód, závislosti, cloud ani data. Zkontroluj strukturu, Git stav, implementované funkce, architekturu, testy, build konfiguraci, bezpečnost, offline chování a možné provozní náklady. Vytvoř navržené auditní dokumenty v `docs/v2/audit/`, pokud je zápis dokumentace v tomto pracovním stromu bezpečný. Každé zjištění dolož konkrétním souborem, testem nebo výstupem kontroly. Na závěr navrhni klasifikaci KEEP/REFINE/REFACTOR/REPLACE/REMOVE/NEW a prvních 5–10 malých migračních úkolů. Nezačínej implementaci bez vyhodnocení auditu.

---

## 21. Kontrolní seznam před zahájením implementace v2.0

- [ ] Existuje bezpečný baseline v1.0.
- [ ] Je znám stav pracovního stromu a větve.
- [ ] Stávající testy a build mají zaznamenaný výsledek.
- [ ] Funkce v1.0 jsou inventarizované.
- [ ] Závislosti a služby prošly nákladovým auditem.
- [ ] Datové modely a cloud jsou zmapované.
- [ ] Existuje migrační doporučení.
- [ ] Je schválen mobilní informační model.
- [ ] Je schválen design systém.
- [ ] Je popsána lokální databáze.
- [ ] Je popsána synchronizace a konflikty.
- [ ] Existuje testovací strategie.
- [ ] Existuje backlog malých úkolů.
- [ ] Každý nový externí nástroj prošel Zero-Cost Gate.

Dokud tyto body nejsou rozumně splněné, nevytvářej rozsáhlou paralelní implementaci funkcí.

---

## 22. Konečný cíl

Výsledkem má být SeoulMate v2.0, který:

- je plnohodnotný na Androidu a iOS;
- funguje při cestě i bez internetu;
- bezpečně synchronizuje data čtyř přátel;
- spojuje plán, místa, dokumenty, jazyk, jídlo, nouzi, výdaje a vzpomínky;
- má jednotný moderní design a Haechiho;
- nevyžaduje pravidelné provozní platby;
- lze zálohovat, obnovit a dlouhodobě udržovat;
- má testy, dokumentaci a reprodukovatelný build;
- může později běžet na Windows a macOS jako pohodlný companion bez exkluzivních funkcí;
- lze dále rozvíjet Codexem i Claude Code podle stejného zdroje pravdy.


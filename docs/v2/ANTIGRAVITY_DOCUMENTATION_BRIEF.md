# SeoulMate v2.0 — kompletní zadání pro Google Antigravity

**Účel:** vytvořit celou výrobní dokumentaci SeoulMate v2.0 v jednom řízeném cíli  
**Určeno pro:** Google Antigravity / Antigravity IDE  
**Režim:** Planning Mode, jeden dlouhý `/goal`  
**Datum:** 15. srpna 2026  
**Nadřazený zdroj pravdy:** `docs/v2/00_MASTER_PLAN.md`  

---

## 1. Jak tento soubor použít

Tento dokument je přímo vykonatelné zadání pro Antigravity. Uživatel nemá jeho obsah ručně kopírovat.

Po otevření skutečného repozitáře SeoulMate v Antigravity:

1. zvol **Planning Mode**;
2. ponech zapnuté vyžádání kontroly plánu, pokud chceš plán před zahájením schválit;
3. do Agent panelu vlož jediný příkaz:

```text
/goal @docs/v2/ANTIGRAVITY_DOCUMENTATION_BRIEF.md Proveď celé zadání od začátku do konce. Vytvoř kompletní dokumentaci SeoulMate v2.0, proveď závěrečnou kontrolu konzistence a skonči až po vytvoření všech požadovaných souborů a souhrnného reportu. Neměň aplikační kód.
```

Pokud prostředí příkaz `/goal` nenabízí, použij stejnou větu bez `/goal`.

---

## 2. Role Antigravity

Jsi vedoucí produktový architekt, UX architekt, Flutter technický architekt, content designer, QA lead, bezpečnostní reviewer a technický autor projektu SeoulMate v2.0.

Máš vytvořit úplnou, vzájemně konzistentní a implementovatelnou dokumentaci, podle které mohou Codex, Claude Code nebo Antigravity následně aplikaci téměř autonomně vyvinout.

Tvým cílem není vytvářet co nejvíce textu. Tvým cílem je odstranit nejasnosti, rozpory a chybějící rozhodnutí tak, aby implementační agent:

- přesně věděl, co má vytvořit;
- chápal pořadí a závislosti;
- nemusel znovu navrhovat produkt;
- znal akceptační kritéria;
- dokázal ověřit výsledek;
- nezavedl placenou službu ani skryté náklady;
- neztratil existující práci SeoulMate v1.0;
- vytvořil úplný mobilní produkt pro Android a iOS;
- považoval Windows a macOS jen za pozdější doplněk bez exkluzivních funkcí.

---

## 3. Povinné vstupy

Nejdříve beze změny přečti:

1. `AGENTS.md` v kořeni repozitáře;
2. `CLAUDE.md`, pokud existuje;
3. `docs/v2/00_MASTER_PLAN.md`;
4. `docs/v2/23_CLAUDE_CODE_HANDOFF.md`;
5. `DECISIONS.md`, `SETUP.md`, `README.md` a ostatní existující dokumenty;
6. starší dokumentaci SeoulMate v1.0;
7. pouze pro ověření reality také strukturu a relevantní konfigurační soubory existujícího Flutter projektu.

### Hierarchie zdrojů

Při rozporu platí:

1. bezpečnostní instrukce prostředí;
2. aktuální `AGENTS.md`;
3. `docs/v2/00_MASTER_PLAN.md`;
4. schválená novější rozhodnutí v `DECISIONS.md`;
5. tento Antigravity brief;
6. v2 dokumentace vytvořená během tohoto cíle;
7. starší dokumentace v1.0;
8. současná implementace v1.0 jako důkaz stavu, nikoli automatická produktová autorita.

`00_MASTER_PLAN.md` nepřepisuj ani významově neměň. Pokud nalezneš závažný rozpor, zapiš ho do reportu a vytvoř návrh rozhodnutí; neřeš ho tichou změnou Master Planu.

---

## 4. Neměnný produktový základ

Dokumentace musí všude respektovat následující pravidla.

### 4.1 Soukromá aplikace pro čtyři přátele

- SeoulMate slouží primárně konkrétní skupině čtyř rovnocenných lidí.
- Nejde o veřejnou sociální síť ani komerční turistickou platformu.
- Žádné reklamy, veřejné profily, veřejný feed nebo moderace.
- Sdílená data existují pouze uvnitř soukromého tripu.
- Více budoucích soukromých tripů je možné, ale UI zůstává jednoduché.

### 4.2 Mobil je úplný primární produkt

- Všechny uživatelské funkce musí existovat na Androidu a iOS.
- Mobil musí zvládnout nastavení, plánování, správu, import, export, zálohu, obnovu i vytvoření Trip Booku.
- Žádné workflow nesmí vyžadovat Windows nebo macOS.
- Mobilní UX má prioritu a musí fungovat jednou rukou, venku, ve stresu a při nestabilním připojení.

### 4.3 Desktop je pouze sekundární companion

- Windows a macOS mohou později nabídnout stejné doménové funkce ve větším layoutu.
- Mohou zlepšit pohodlí pomocí klávesnice, myši, drag-and-drop a hromadných úprav.
- Nesmí mít jedinou exkluzivní schopnost.
- Funkce založená na mobilním hardwaru může na desktopu dostat alternativní vstup, ne lepší nebo výhradní workflow.
- Desktop nesmí blokovat mobilní release.

### 4.4 Nulové provozní náklady

- Žádná kritická funkce nesmí vyžadovat placený backend, API, mapy, překlad, AI, hosting nebo storage.
- Služba vyžadující kartu nebo umožňující automatické účtování není pro kritické jádro přípustná.
- Bezplatná online služba je jen volitelný adaptér s limitem, cache, bezpečným selháním a lokální alternativou.
- Podmínky a limity musí být před implementací ověřeny z aktuálních oficiálních zdrojů.
- Neomezený AI chat a neomezené cloudové fotografie nejsou součástí produktu.

### 4.5 Local-first a offline-first

- UI čte primárně z lokální databáze.
- Změny se ukládají lokálně jako první.
- Cloud je synchronizační vrstva, nikoli jediný zdroj pravdy.
- Kritické cestovní funkce fungují offline.
- Uživatel vidí stav synchronizace, čekající změny, konflikty a dostupnost souborů offline.
- Trip musí být exportovatelný, zálohovatelný a obnovitelný mimo jednu cloudovou službu.

### 4.6 Migrace místo slepého restartu

- SeoulMate v2.0 je řízená evoluce rozpracovaného v1.0.
- Zachovej vše kvalitní a použitelné.
- Každou oblast klasifikuj jako KEEP, REFINE, REFACTOR, REPLACE, REMOVE nebo NEW.
- Neuváděj, že něco ve v1.0 existuje nebo funguje, pokud to nebylo ověřeno.

---

## 5. Schválený funkční rozsah

Dokumenty musí dohromady úplně specifikovat nejméně následující oblasti:

### Dream — před cestou

- soukromý trip a čtyři členové;
- Home Base;
- Trip Planner a denní itinerář;
- vysvětlitelný Smart Itinerary;
- Places, oblíbené a skupinové hlasování;
- Trip Inbox pro odkazy, screenshoty, soubory a poznámky;
- společný a osobní checklist;
- Readiness Center;
- Travel Vault a rezervace;
- Group Decision Center;
- rozpočet;
- Korean Companion, Food Guide a Survival Guide;
- Offline Trip Pack.

### Adventure — během cesty

- adaptivní Home „Co teď?“;
- dnešní program a časová osa;
- Home Base, Taxi Card a Hotel Card;
- online mapa a Offline Map Lite;
- odkazy do externí navigace;
- offline dokumenty a rezervace;
- Camera Companion s OCR;
- strojový překlad jasně odlišený od ověřeného obsahu;
- Show to Local;
- rychlé karty pro hotel, taxi, letiště, rezervaci, alergii a nouzi;
- Korean Companion;
- Food Guide a alergeny s bezpečnostním upozorněním;
- doprava, metro, T-money a letištní instrukce;
- Emergency Center;
- Budget a OCR účtenek;
- Sync Center;
- volitelné počasí s poslední aktualizací a bezpečným výpadkem.

### Memories — po cestě

- denní kronika;
- dokončené aktivity a navštívená místa;
- osobní a společné poznámky;
- vybrané fotografie, optimalizované náhledy a odkazy na originály;
- automatická kostra deníku;
- achievementy a statistiky;
- PDF Trip Book vytvořitelný na mobilu;
- kompletní export, záloha a obnova.

### Haechi

- moderní vizuální a emocionální průvodce;
- lokální pravidlové chování bez nutné placené AI;
- stavy přípravy, cesty, počasí, offline režimu, synchronizace, úspěchu, dokončeného dne a návratu;
- krátké užitečné texty, které nepůsobí dětsky a nepřekrývají kritické informace.

---

## 6. Způsob práce v tomto cíli

Jde o jeden uživatelský cíl, ale uvnitř ho rozděl do navazujících pracovních skupin. Dokumenty nevytvářej izolovaně nebo skutečně souběžně bez společného modelu; jejich konzistence je důležitější než rychlost.

### Skupina A — inventář a mezery

1. Zmapuj existující dokumentaci a relevantní skutečnosti v repozitáři.
2. Vytvoř matici témat, dokumentů a zdrojů.
3. Označ známé, odvozené, neověřené a dosud nerozhodnuté informace.
4. Nedomýšlej fakta o implementaci.

### Skupina B — společný slovník a rozhodnutí

1. Sjednoť názvy režimů, modulů, entit, stavů a priorit.
2. Definuj P0, P1 a P2 podle Master Planu.
3. Připrav registr rozhodnutí a otevřených otázek.
4. Pokud lze bezpečně použít explicitní pravidlo Master Planu, neblokuj práci zbytečným dotazem.

### Skupina C — produktová a UX dokumentace

Vytvoř vizi, rozsah, PRD, jobs/persony, user flows, informační architekturu, katalog obrazovek a podrobnou UX specifikaci.

### Skupina D — design a obsah

Vytvoř design systém, Haechi guide, obsahovou strategii, datové požadavky obsahu a asset manifest. Nevytvářej finální obrázky, pokud k tomu uživatel nedal samostatné zadání; přesně ale popiš, co bude potřeba vytvořit.

### Skupina E — technická dokumentace

Vytvoř architekturu, datový model, synchronizaci, offline strategii, integrace, bezpečnost, soukromí, přístupnost a lokalizaci.

### Skupina F — výroba a předání agentům

Vytvoř testing, release, migraci, Codex workflow, Antigravity workflow, acceptance criteria, roadmapu, atomický backlog a setup pro začátečníka.

### Skupina G — závěrečný audit

1. Proveď kontrolu každého odkazu na jiný dokument.
2. Vyhledej rozpory v názvech, prioritách, platformách, architektuře a nákladech.
3. Ověř úplné pokrytí všech funkcí.
4. Ověř, že žádná funkce není desktop-only.
5. Ověř, že žádná kritická funkce nezávisí na placené službě.
6. Ověř, že každý implementační epic má akceptační kritéria a testovací důkaz.
7. Vytvoř finální report.

---

## 7. Povinné výstupní soubory

Zachovej existující `00_MASTER_PLAN.md` a `23_CLAUDE_CODE_HANDOFF.md`. Vytvoř nebo obsahově doplň následující soubory v `docs/v2/`:

1. `01_VISION_AND_PRINCIPLES.md`
2. `02_PRODUCT_SCOPE.md`
3. `03_PRD.md`
4. `04_PERSONAS_AND_JOBS.md`
5. `05_USER_FLOWS.md`
6. `06_INFORMATION_ARCHITECTURE.md`
7. `07_SCREEN_CATALOG.md`
8. `08_UX_SPECIFICATION.md`
9. `09_DESIGN_SYSTEM.md`
10. `10_HAECHI_GUIDE.md`
11. `11_CONTENT_STRATEGY.md`
12. `12_TECHNICAL_ARCHITECTURE.md`
13. `13_DATA_MODEL.md`
14. `14_SYNC_AND_CONFLICTS.md`
15. `15_OFFLINE_STRATEGY.md`
16. `16_INTEGRATIONS_AND_DATA_SOURCES.md`
17. `17_SECURITY_AND_PRIVACY.md`
18. `18_ACCESSIBILITY_AND_LOCALIZATION.md`
19. `19_TESTING_STRATEGY.md`
20. `20_RELEASE_AND_DISTRIBUTION.md`
21. `21_MIGRATION_V1_TO_V2.md`
22. `22_CODEX_WORKFLOW.md`
23. `24_ACCEPTANCE_CRITERIA.md`
24. `25_ROADMAP.md`
25. `26_TASK_BACKLOG.md`
26. `27_SETUP_FOR_BEGINNERS.md`
27. `DECISIONS.md`
28. `GLOSSARY.md`
29. `DOCUMENTATION_INDEX.md`
30. `TRACEABILITY_MATRIX.md`
31. `ZERO_COST_REGISTER.md`
32. `RISK_REGISTER.md`
33. `ASSET_MANIFEST.md`
34. `CONTENT_INVENTORY.md`
35. `DOCUMENTATION_QA_REPORT.md`

V kořeni repozitáře vytvoř nebo navrhni aktualizaci:

36. `AGENTS.md`
37. `CLAUDE.md`
38. `SETUP.md`

Pokud kořenové soubory již obsahují platné instrukce, zachovej je a proveď pouze slučitelnou změnu. Pokud je jejich změna zakázána aktuálními instrukcemi prostředí, vytvoř návrhy v `docs/v2/proposed-root-files/` a tuto skutečnost uveď v QA reportu.

### Auditní dokumenty

Pokud je k dispozici skutečný repozitář v1.0, vytvoř navíc:

- `docs/v2/audit/REPOSITORY_AUDIT.md`
- `docs/v2/audit/FEATURE_INVENTORY.md`
- `docs/v2/audit/DEPENDENCY_AND_COST_AUDIT.md`
- `docs/v2/audit/TEST_BASELINE.md`
- `docs/v2/audit/MIGRATION_RECOMMENDATION.md`

Pokud repozitář v1.0 nebo jeho část není dostupná, nevymýšlej výsledky. Vytvoř připravené auditní postupy, jasně je označ `PENDING REPOSITORY AUDIT` a odděl je od ověřených skutečností.

---

## 8. Minimální obsah jednotlivých dokumentů

### `01_VISION_AND_PRINCIPLES.md`

- problém a příležitost;
- produktová vize;
- Dream, Adventure, Memories;
- cíle a non-goals;
- neměnné principy;
- metriky úspěchu vhodné pro čtyři uživatele;
- pravidlo mobilní úplnosti a desktop parity.

### `02_PRODUCT_SCOPE.md`

- P0/P1/P2;
- kompletní moduly;
- in-scope a out-of-scope;
- platformní matice dokazující, že mobil má vše;
- závislosti a pořadí vydání;
- deferred backlog.

### `03_PRD.md`

- kontext, uživatelé a cíle;
- úplné funkční požadavky s ID;
- nefunkční požadavky;
- offline, synchronizace, výkon, bezpečnost a přístupnost;
- acceptance odkazy;
- rizika a otevřené otázky.

### `04_PERSONAS_AND_JOBS.md`

- čtyři rovnocenní cestovatelé bez vymyšlených osobních údajů;
- situační persony před cestou, během ní a po ní;
- Jobs to Be Done;
- stresové a offline kontexty;
- potřeby začátečníka spravujícího projekt.

### `05_USER_FLOWS.md`

- onboarding a vstup do tripu;
- příprava;
- přidání místa a hlasování;
- itinerář;
- Inbox classification;
- dokument offline;
- Travel Day;
- Camera Companion;
- Show to Local;
- Emergency;
- výdaj a OCR;
- konflikt synchronizace;
- Memories, Trip Book, export a obnova;
- happy path, error path a offline path.

### `06_INFORMATION_ARCHITECTURE.md`

- mobilní navigace;
- hierarchie modulů;
- cross-links;
- rychlé vstupy;
- stavové přechody Dream/Adventure/Memories;
- desktopová adaptace bez nových funkcí.

### `07_SCREEN_CATALOG.md`

Pro každou obrazovku:

- stabilní ID;
- účel;
- primární uživatel;
- vstupní cesty;
- obsah a komponenty;
- hlavní akce;
- empty/loading/error/offline/sync stavy;
- oprávnění;
- návaznosti;
- analytika pouze pokud bude privacy-first schválena;
- mobilní varianta a případná desktopová adaptace.

### `08_UX_SPECIFICATION.md`

- pravidla „Co teď?“;
- jednoruké ovládání;
- kritické a stresové scénáře;
- formuláře, validace a undo;
- stav synchronizace;
- offline komunikace;
- bezpečnost OCR, překladů a alergenů;
- mikrotexty a tón;
- responzivní zásady.

### `09_DESIGN_SYSTEM.md`

- designové principy;
- sémantické tokeny;
- barvy, typografie a korejské fonty;
- spacing, grid, radius, elevation;
- komponenty a jejich stavy;
- Dream/Adventure/Memories výraz;
- light/dark;
- motion a reduced motion;
- přístupnost;
- pravidla assetů;
- způsob vizuální QA.

Nevymýšlej neověřené konkrétní fontové nebo assetové licence. Označ je k ověření.

### `10_HAECHI_GUIDE.md`

- role a charakter;
- vizuální směr;
- tón;
- povolené a zakázané chování;
- stavový model;
- pozice/pózy/výrazy;
- použití na obrazovkách;
- lokální šablony;
- přístupnost;
- seznam assetů a animačních potřeb.

### `11_CONTENT_STRATEGY.md`

- taxonomie obsahu;
- workflow tvorby a odborné kontroly;
- zdroj, licence a datum kontroly;
- česká výslovnost a romanizace;
- korejský, český a budoucí anglický obsah;
- aktualizace balíčků;
- bezpečnost nouzového, zdravotního a alergenového obsahu.

### `12_TECHNICAL_ARCHITECTURE.md`

- Flutter vrstvy a feature-based struktura;
- Riverpod, GoRouter a Drift jako cílový směr, podmíněný auditem;
- lokální databáze, soubory, synchronizační fronta a adaptéry;
- cloud jako volitelná synchronizační vrstva;
- platformní abstrakce;
- dependency rules;
- chybové a observační mechanismy bez úniku osobních dat;
- textové Mermaid diagramy, pokud zpřehlední architekturu.

### `13_DATA_MODEL.md`

- entity, hodnotové objekty a relace;
- stabilní ID;
- audit fields, revision, tombstone a sync status;
- dokumenty a binární metadata;
- měny a výdaje;
- content entities;
- indexy;
- migrace a verzování schématu;
- citlivost dat a retention.

### `14_SYNC_AND_CONFLICTS.md`

- local-first zápis;
- outbox/inbox;
- idempotence;
- retry/backoff;
- stavový automat;
- konflikt podle typu entity;
- tombstones;
- přílohy;
- čtyři zařízení a více zařízení jednoho člena;
- Sync Center;
- recovery a testovací matice.

### `15_OFFLINE_STRATEGY.md`

- co funguje offline;
- manifest Offline Trip Packu;
- velikost, verze, stáří a integrita;
- stažení, aktualizace a odstranění;
- dokumenty, audio, obsah a mapa;
- nedostatek místa;
- první spuštění bez internetu;
- degradace každé online funkce.

### `16_INTEGRATIONS_AND_DATA_SOURCES.md`

- registrační karta každé integrace;
- účel, vlastník, data, licence, limity, náklady, privacy;
- timeout, cache, fallback a vypnutí;
- Zero-Cost Gate;
- mapy, počasí, OCR, překlad, externí navigace a volitelný cloud;
- požadavek ověření z aktuálních oficiálních zdrojů před kódováním.

### `17_SECURITY_AND_PRIVACY.md`

- threat model;
- autentizace a autorizace;
- local storage a platform security;
- dokumenty, zdravotní údaje a nouzové údaje;
- secrets;
- logování;
- exporty;
- cloud rules;
- incident a recovery;
- security test checklist.

### `18_ACCESSIBILITY_AND_LOCALIZATION.md`

- screen reader;
- focus a klávesnice;
- kontrast, text scaling a touch targets;
- reduced motion;
- korejština;
- čeština jako první úplný jazyk;
- připravenost angličtiny;
- Emergency a Show to Local;
- testovací matice.

### `19_TESTING_STRATEGY.md`

- test pyramid;
- unit, widget, golden, integration a migration testy;
- fake externí služby;
- offline, sync a conflict scénáře;
- zařízení a platformy;
- přístupnost a výkon;
- release gates;
- evidence výsledků.

### `20_RELEASE_AND_DISTRIBUTION.md`

- interní Android/iOS distribuce;
- signing bez ukládání secrets;
- CI;
- verze a changelog;
- migrace a rollback;
- store vydání jako oddělené rozhodnutí;
- desktop až po mobilním release candidate;
- nulové provozní náklady versus případné poplatky obchodů.

### `21_MIGRATION_V1_TO_V2.md`

- baseline;
- audit;
- KEEP/REFINE/REFACTOR/REPLACE/REMOVE/NEW;
- migrační vrstvy;
- datové převody;
- feature flags, pokud pomohou;
- rollback a záloha;
- pořadí bez big-bang přepisu.

### `22_CODEX_WORKFLOW.md`

- načítání instrukcí;
- malý vertikální řez;
- branch/worktree;
- testy a vizuální QA;
- bezpečné lokální commity;
- oprávnění pro push/PR/merge;
- report pro začátečníka;
- Definition of Done.

### `24_ACCEPTANCE_CRITERIA.md`

- akceptační kritéria s jednoznačnými ID;
- Given/When/Then tam, kde pomáhá;
- každý P0 a P1 modul;
- offline, sync, security, accessibility a cost;
- důkaz ověření;
- vazba na PRD a backlog.

### `25_ROADMAP.md`

- závislostní fáze místo nereálného kalendářního slibu;
- dokumentace, audit, základ, P0, P1, hardening, desktop;
- vstupní a výstupní podmínky;
- kritická cesta;
- rozhodovací brány.

### `26_TASK_BACKLOG.md`

- epics a malé atomické úkoly;
- stabilní task ID;
- cíl, rozsah, mimo rozsah, závislosti;
- soubory/oblasti;
- acceptance IDs;
- testy;
- Zero-Cost kontrola;
- Definition of Done;
- doporučené pořadí pro agenty;
- úkoly přiměřené jednomu kontrolovatelnému PR.

### `27_SETUP_FOR_BEGINNERS.md`

Piš česky jako pro člověka, který nikdy nenastavoval vývojové prostředí. Odděl Windows a macOS. U každého kroku vysvětli:

- co instalujeme;
- proč;
- kam kliknout;
- co vložit do terminálu;
- jak poznat úspěch;
- nejčastější problém;
- co se nesmí sdílet nebo commitnout.

Pokryj Git, GitHub, Flutter, Android Studio, emulátor, telefon, Xcode, iOS simulátor, iPhone, VS Code, Codex, Claude Code, Antigravity, proměnné prostředí, Firebase pouze pokud zůstane schválený, testy a první bezpečný pracovní postup. Aktuální instalační kroky označ k ověření z oficiální dokumentace.

### Registry a indexy

- `DECISIONS.md`: rozhodnutí, stav, důvod, alternativy, dopady a datum.
- `GLOSSARY.md`: jeden závazný slovník názvů.
- `DOCUMENTATION_INDEX.md`: účel, autorita, stav a odkazy všech dokumentů.
- `TRACEABILITY_MATRIX.md`: product goal → PRD ID → screen/flow → data → acceptance → task → test.
- `ZERO_COST_REGISTER.md`: každá závislost a integrace přes Zero-Cost Gate.
- `RISK_REGISTER.md`: pravděpodobnost, dopad, vlastník, mitigace, trigger.
- `ASSET_MANIFEST.md`: potřebný asset, formát, rozměry/varianty, stav, licence a zdroj.
- `CONTENT_INVENTORY.md`: obsahové balíčky, stav, vlastník, zdroj a kontrola.
- `DOCUMENTATION_QA_REPORT.md`: úplnost, rozpory, neověřené údaje, broken links a finální verdikt.

---

## 9. Pravidla kvality dokumentů

Každý dokument musí:

- být konkrétní pro SeoulMate, ne generická šablona;
- používat jednotné názvy z `GLOSSARY.md`;
- rozlišovat ověřený fakt, schválené rozhodnutí, doporučení a otevřenou otázku;
- uvádět vazby na relevantní dokumenty;
- obsahovat příklady tam, kde odstraňují nejasnost;
- obsahovat jasné acceptance nebo výstupní podmínky;
- nepoužívat prázdné fráze typu „implementovat podle best practices“ bez definice;
- neobsahovat `TODO` tam, kde lze odpověď odvodit z Master Planu;
- u skutečně chybějícího rozhodnutí použít stabilní `OPEN-xxx` ID;
- být validní UTF-8 Markdown;
- mít konzistentní nadpisy, tabulky, odkazy a relativní cesty;
- nepřepisovat stejnou autoritativní specifikaci protichůdně na více místech.

Použij Mermaid pouze pro vztahy, které jsou srozumitelnější vizuálně, například:

- architekturu;
- synchronizační stavový automat;
- hlavní user flows;
- pořadí migrace.

---

## 10. Pravidla práce s nejistotou

Nevymýšlej:

- současný stav kódu;
- jména čtyř uživatelů;
- termín konkrétní cesty;
- zdravotní údaje;
- API klíče;
- aktuální limity služeb bez ověření;
- licence assetů;
- výsledky testů, které nebyly spuštěny;
- dostupnost funkce na platformě bez ověření.

Používej označení:

- `VERIFIED`: potvrzeno souborem, kódem, testem nebo oficiálním zdrojem;
- `APPROVED`: schváleno v Master Planu;
- `PROPOSED`: doporučení čekající na rozhodnutí;
- `OPEN`: nelze bezpečně rozhodnout;
- `PENDING AUDIT`: vyžaduje skutečný repozitář nebo prostředí.

Ptej se uživatele jen tehdy, pokud chybějící odpověď zásadně mění produkt, data, náklady, soukromí nebo migrační bezpečnost. Ostatní bezpečné návrhy označ `PROPOSED` a pokračuj.

---

## 11. Omezení tohoto cíle

Během tohoto cíle:

- neměň aplikační zdrojový kód;
- neměň závislosti;
- nespouštěj produkční migrace;
- neměň cloudové účty;
- nevytvářej placené prostředky;
- necommituj secrets;
- nemaž starou dokumentaci;
- nevytvářej finální grafické assety;
- neprováděj release;
- nepushuj ani nemerguj bez oprávnění.

Povoleno je:

- čtení repozitáře;
- bezpečné read-only kontroly;
- vytváření a úprava v2 dokumentace;
- kontrola relativních odkazů;
- vytvoření závěrečného reportu;
- lokální commit dokumentace pouze pokud je pracovní strom čistý, instrukce to dovolují a uživatel dal oprávnění.

---

## 12. Povinná závěrečná kontrola

Před dokončením automaticky zkontroluj:

### Pokrytí

- všechny povinné soubory existují;
- žádný není prázdná šablona;
- všechny P0 a P1 funkce jsou pokryty v PRD, UX, datech, acceptance a backlogu;
- P2 je oddělené a neblokuje mobil.

### Konzistence

- stejné názvy modulů a režimů;
- stejné priority;
- stejné datové entity;
- stejné platformní pravidlo;
- stejné Zero-Cost pravidlo;
- žádné protichůdné Definition of Done.

### Mobilní úplnost

- Android a iOS mají všechny funkce;
- export, záloha, obnova a Trip Book fungují na mobilu;
- desktop nemá exkluzivní funkci;
- desktop je až po mobilním hardeningu.

### Zero-Cost

- každá online služba je v registru;
- žádná kritická funkce nevyžaduje kartu nebo placený tarif;
- každý limit má bezpečný fallback;
- neověřené aktuální podmínky jsou označené.

### Implementovatelnost

- každý epic má závislosti;
- každý atomický úkol má acceptance IDs a testy;
- traceability matrix nemá osiřelé požadavky;
- migrace chrání v1 data;
- agenti vědí, kdy musí zastavit a požádat o rozhodnutí.

### Markdown

- validní UTF-8;
- funkční relativní odkazy;
- žádné konfliktní značky;
- žádné náhodné absolutní cesty z jednoho počítače;
- žádné vložené tajné údaje.

Výsledek zapiš do `docs/v2/DOCUMENTATION_QA_REPORT.md`.

---

## 13. Definition of Done tohoto Antigravity cíle

Cíl je hotový pouze když:

1. byly přečteny povinné vstupy;
2. byla zmapována existující dokumentace a dostupný repozitář;
3. byly vytvořeny všechny povinné dokumenty;
4. dokumenty jsou obsahově konkrétní a vzájemně propojené;
5. existuje jednotný glossary a index;
6. existuje traceability od cíle až k testu;
7. existuje atomický implementační backlog;
8. Zero-Cost Register pokrývá všechny integrace;
9. migrace chrání existující v1.0;
10. mobil je všude popsaný jako úplný produkt;
11. desktop nemá žádnou exkluzivní funkci;
12. neověřená fakta jsou transparentně označená;
13. byl proveden a uložen závěrečný QA audit;
14. aplikační kód nebyl změněn;
15. závěrečný report uživateli jednoduše vysvětluje výsledek.

---

## 14. Závěrečný report uživateli

Po dokončení napiš česky a jednoduše:

1. kolik dokumentů vzniklo nebo bylo aktualizováno;
2. kde jsou uložené;
3. které části jsou plně rozhodnuté;
4. které položky čekají na audit repozitáře nebo rozhodnutí uživatele;
5. zda byly nalezeny rozpory;
6. zda Zero-Cost Gate odhalil riziko;
7. zda je dokumentace připravená pro Codex, Claude Code a Antigravity;
8. jaký je jediný doporučený další krok.

Neskonči pouhým tvrzením „dokumentace byla vytvořena“. Uveď konkrétní soubory, QA výsledek a známá omezení.

# SeoulMate v2.0 — Akceptační kritéria (Acceptance Criteria)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Vazba na požadavky:** [03_PRD.md](03_PRD.md)

---

## 1. Pravidla akceptačních kritérií

Tento dokument definuje jednoznačná a testovatelná akceptační kritéria pro všech 44 funkčních požadavků a 6 nefunkčních požadavků specifikovaných v [03_PRD.md](03_PRD.md). Každé kritérium je formulováno ve struktuře **Given** (Předpoklad), **When** (Akce), **Then** (Očekávaný výsledek).

---

## 2. Funkční akceptační kritéria (AC pro REQ-*)

### 2.1 Trip a členové
- **AC-TRIP-001 (navázáno na REQ-TRIP-001):**
  - *Given* uživatel zadá název tripu „Korea 2026“, termín 1.10.–14.10.2026, časové pásmo Asia/Seoul a měny KRW/CZK,
  - *When* formulář potvrdí,
  - *Then* aplikace v lokální Drift DB vytvoří záznam tripu s 14 dny a nastaví výchozí měnu a časové pásmo.
- **AC-TRIP-002 (navázáno na REQ-TRIP-002):**
  - *Given* existující trip,
  - *When* je přidán profil 4 členů s avatarem, dietním omezením a nouzovým kontaktem,
  - *Then* jsou všichni 4 členové uloženi v DB s rovnocennými právy a zobrazují se v nastavení tripu.
- **AC-TRIP-003 (navázáno na REQ-TRIP-003):**
  - *Given* uživatel zadá hotel „Ryse Hotel“ s korejskou adresou, souřadnicemi a check-in časem,
  - *When* ubytování uloží,
  - *Then* se vytvoří Home Base záznam propojitelný s Taxi Card a Emergency modulem.

### 2.2 Adaptivní Home („Co teď?“)
- **AC-HOME-001 (navázáno na REQ-HOME-001):**
  - *Given* probíhající den v Koreji a čas 10:00 s aktivitou v 10:30,
  - *When* uživatel otevře aplikaci,
  - *Then* dominantní karta „Co teď?“ zobrazí nejbližší aktivitu a doporučení odchodu.
- **AC-HOME-002 (navázáno na REQ-HOME-002):**
  - *Given* zobrazená akční karta „Odchod k hotelu“,
  - *When* uživatel klepne na akční tlačítko,
  - *Then* se jedním klepnutím otevře navigační karta bez mezikroků.
- **AC-HOME-003 (navázáno na REQ-HOME-003):**
  - *Given* domovská obrazovka,
  - *When* je aplikace v libovolném stavu sítě,
  - *Then* je v horní liště trvale viditelné červené tlačítko Emergency, rychlá Taxi Card a indikátor stavu synchronizace.

### 2.3 Plánovač cesty (Smart Itinerary)
- **AC-PLAN-001 (navázáno na REQ-PLAN-001):**
  - *Given* trip od 1. do 10. října (10 dní),
  - *When* je trip inicializován,
  - *Then* vznikne v DB přesně 10 navazujících denních záznamů Day 1 až Day 10.
- **AC-PLAN-002 (navázáno na REQ-PLAN-002):**
  - *Given* aktivita „Prohlídka paláce“ na Day 2 v 14:00,
  - *When* uživatel aktivitu přetáhne na Day 3 v 10:00,
  - *Then* se změna okamžitě uloží do DB a zařadí do synchronizačního outboxu.
- **AC-PLAN-003 (navázáno na REQ-PLAN-003):**
  - *Given* dvě aktivity v jednom dni se shodným časem 15:00–17:00,
  - *When* je druhá aktivita uložena,
  - *Then* aplikace zobrazí vizuální varovný odznak časového konfliktu.
- **AC-PLAN-004 (navázáno na REQ-PLAN-004):**
  - *Given* návrh Smart Itinerary na přeřazení míst v čtvrti Hongdae,
  - *When* uživatel otevře detail návrhu,
  - *Then* vidí zdůvodnění („Ušetří 30 minut chůze“), míru jistoty, tlačítka Přijmout/Odmítnout a po přijetí tlačítko Zpět (Undo).
- **AC-PLAN-005 (navázáno na REQ-PLAN-005):**
  - *Given* aktivita „Večeře K-BBQ“,
  - *When* uživatel k aktivitě přiřadí místo z katalogu Places a frázi,
  - *Then* jsou vazby zobrazeny v detailu aktivity a kliknutím otevřou příslušný modul.

### 2.4 Místa a Group Decision Center
- **AC-PLC-001 (navázáno na REQ-PLC-001):**
  - *Given* bod zájmu v databázi,
  - *When* je otevřen detail,
  - *Then* se zobrazí korejský název Hangulem, český popis, otevírací doba a cenová hladina.
- **AC-PLC-002 (navázáno na REQ-PLC-002):**
  - *Given* 4 členové hlasující o místě,
  - *When* 3 dají Upvote a 1 Downvote,
  - *Then* výsledné skóre je +2 a místo se posune na příslušnou pozici v řazení.
- **AC-PLC-003 (navázáno na REQ-PLC-003):**
  - *Given* nerozhodné hlasování 2:2 nebo sporný výdaj,
  - *When* uživatel otevře Group Decision Center,
  - *Then* vidí všechny nevyřešené volby skupiny na jednom místě s možností rychlého potvrzení.
- **AC-PLC-004 (navázáno na REQ-PLC-004):**
  - *Given* místo se zadanými GPS souřadnicemi,
  - *When* uživatel klepne na „Navigovat v Naver Maps“,
  - *Then* se otevře nativní aplikace Naver Map s předaným cílem.

### 2.5 Trip Inbox
- **AC-INB-001 (navázáno na REQ-INB-001):**
  - *Given* uživatel nasdílí webový odkaz z prohlížeče do SeoulMate,
  - *When* je odkaz přijat,
  - *Then* se v Trip Inboxu vytvoří nezařazená položka s náhledem a časovým razítkem.
- **AC-INB-002 (navázáno na REQ-INB-002):**
  - *Given* položka v Inboxu,
  - *When* uživatel vybere možnost „Převést na Místo“,
  - *Then* se otevře předvyplněný formulář místa a původní surový záznam zůstane archivován.

### 2.6 Checklist a Readiness Center
- **AC-CHK-001 (navázáno na REQ-CHK-001):**
  - *Given* společný checklist,
  - *When* člen zaškrtne položku „Zařídit cestovní pojištění“,
  - *Then* je položka označena jako hotová a změna se zapíše do lokální DB s jménem autora.
- **AC-CHK-002 (navázáno na REQ-CHK-002):**
  - *Given* chybějící letenky 3 dny před odletem,
  - *When* uživatel otevře Readiness Center,
  - *Then* je celkový stav označen jako „Kritické“ s přímým odkazem na nahrání dokladu.

### 2.7 Travel Vault
- **AC-VLT-001 (navázáno na REQ-VLT-001):**
  - *Given* PDF soubor letenky,
  - *When* uživatel soubor nahraje do Vaultu,
  - *Then* se soubor uloží do chráněného lokálního adresáře aplikace a metadata do DB.
- **AC-VLT-002 (navázáno na REQ-VLT-002):**
  - *Given* telefon v offline režimu bez signálu,
  - *When* uživatel otevře nahranou letenku ve Vaultu,
  - *Then* se PDF okamžitě a bez chyby zobrazí v integrovaném prohlížeči.
- **AC-VLT-003 (navázáno na REQ-VLT-003):**
  - *Given* lokální úložiště dokladů,
  - *When* aplikace ukládá soubor na disk,
  - *Then* je soubor zašifrován a klíče uloženy v zabezpečeném úložišti platformy.

### 2.8 Korean Companion a Food Guide
- **AC-KOR-001 (navázáno na REQ-KOR-001):**
  - *Given* fráze v Korean Companion,
  - *When* je otevřen detail fráze,
  - *Then* se zobrazí Hangul, česká fonetika `[a-ňong-ha-se-jo]` a tlačítko přehrání audia.
- **AC-KOR-002 (navázáno na REQ-KOR-002):**
  - *Given* jídlo obsahující skrytý rybí vývar,
  - *When* si vegetarián otevře detail jídla ve Food Guide,
  - *Then* je viditelně zobrazeno oranžové varování před skrytými živočišnými složkami.
- **AC-KOR-003 (navázáno na REQ-KOR-003):**
  - *Given* potřeba ukázat korejský text obsluze,
  - *When* uživatel aktivuje Show to Local,
  - *Then* se text zvětší na celou obrazovku s maximálním kontrastem a možností zvýšit jas.

### 2.9 Rychlé karty
- **AC-CRD-001 (navázáno na REQ-CRD-001):**
  - *Given* uživatel nastupující do taxi,
  - *When* klepne na ikonu Taxi Card,
  - *Then* se do 1 vteřiny zobrazí korejská adresa Home Base ve velkém Hangulu bez nutnosti sítě.

### 2.10 Survival Guide a doprava
- **AC-SRV-001 (navázáno na REQ-SRV-001):**
  - *Given* uživatel v metru bez signálu,
  - *When* otevře Survival Guide -> Metro,
  - *Then* vidí kompletní offline instrukce k T-money, přestupům a číslům východů.

### 2.11 Camera Companion
- **AC-CAM-001 (navázáno na REQ-CAM-001):**
  - *Given* namíření kamery na korejský text,
  - *When* proběhne rozpoznání on-device přes Google ML Kit,
  - *Then* aplikace zobrazí rozpoznaný text Hangulem bez volání cloudových serverů.
- **AC-CAM-002 (navázáno na REQ-CAM-002):**
  - *Given* rozpoznaný text jídla,
  - *When* aplikace najde shodu v lokálním Food Guide,
  - *Then* zobrazí detail jídla, alergeny a tlačítko Show to Local.
- **AC-CAM-003 (navázáno na REQ-CAM-003):**
  - *Given* výsledek z kamery je strojový překlad,
  - *When* je vykreslen na displeji,
  - *Then* nese zřetelné označení „Strojový překlad“ a zachovává původní text.

### 2.12 Emergency Center
- **AC-EMG-001 (navázáno na REQ-EMG-001):**
  - *Given* krizová situace,
  - *When* uživatel otevře Emergency Center,
  - *Then* má na 1 klepnutí k dispozici volání na 112, 119 a kontakt na Ambasádu ČR v Soulu.
- **AC-EMG-002 (navázáno na REQ-EMG-002):**
  - *Given* ztracený cestovatel v noci,
  - *When* otevře nouzovou kartu Home Base,
  - *Then* se zobrazí adresa v korejštině pro policii/taxi offline.
- **AC-EMG-003 (navázáno na REQ-EMG-003):**
  - *Given* zdravotní profil 4 členů,
  - *When* lékař potřebuje znát krevní skupinu a alergie člena,
  - *Then* jsou tyto údaje okamžitě čitelné v nouzové kartě člena.

### 2.13 Rozpočet a výdaje
- **AC-BDG-001 (navázáno na REQ-BDG-001):**
  - *Given* výdaj v KRW,
  - *When* je uložen s plátcem a kategorií,
  - *Then* se částka započte do celkové bilance tripu a přepočte orientačně na CZK.
- **AC-BDG-002 (navázáno na REQ-BDG-002):**
  - *Given* výdaj 40 000 KRW rozdělený rovně na 4 lidi,
  - *When* uživatel otevře vyrovnání dluhů,
  - *Then* systém zobrazí přesně 10 000 KRW na osobu a minimální počet transakcí pro vyrovnání.
- **AC-BDG-003 (navázáno na REQ-BDG-003):**
  - *Given* fotka účtenky,
  - *When* on-device OCR navrhne částku a datum,
  - *Then* je uživateli zobrazen formulář k povinnému ručnímu schválení před uložením.

### 2.14 Mapy (Online & Offline Map Lite)
- **AC-MAP-001 (navázáno na REQ-MAP-001):**
  - *Given* zobrazení denního programu,
  - *When* je zapnut offline režim,
  - *Then* Offline Map Lite zobrazí orientační body aktivit, Home Base a vzdušné vzdálenosti.

### 2.15 Počasí
- **AC-WTH-001 (navázáno na REQ-WTH-001):**
  - *Given* výpadek internetu nebo API Open-Meteo,
  - *When* uživatel otevře Home,
  - *Then* se zobrazí poslední známá stažená data s časovým razítkem nebo se modul skryje bez chybové hlášky.

### 2.16 Memories, kronika a statistiky
- **AC-MEM-001 (navázáno na REQ-MEM-001):**
  - *Given* dokončený den cesty,
  - *When* uživatel otevře kroniku dne,
  - *Then* vidí seznam navštívených míst a může doplnit textový zápisek.
- **AC-MEM-002 (navázáno na REQ-MEM-002):**
  - *Given* výběr 5 fotografií dne,
  - *When* jsou uloženy do kroniky,
  - *Then* se vytvoří lokální optimalizované miniatury s odkazy na původní soubory.
- **AC-MEM-003 (navázáno na REQ-MEM-003):**
  - *Given* záznamy z 14denního tripu,
  - *When* uživatel zvolí „Exportovat PDF Trip Book“,
  - *Then* mobilní telefon vygeneruje vícestránkové PDF se statistikami, místy a fotkami.
- **AC-MEM-004 (navázáno na REQ-MEM-004):**
  - *Given* průchod dnem,
  - *When* den skončí,
  - *Then* aplikace automaticky předpřipraví kostru deníku a aktualizuje odznaky (achievementy).

### 2.17 Offline Trip Pack a Synchronizace
- **AC-OFF-001 (navázáno na REQ-OFF-001):**
  - *Given* příprava na odlet,
  - *When* uživatel klepne na „Stáhnout Offline Trip Pack“,
  - *Then* se zkontroluje integrita všech lokálních balíčků a zobrazí se zelený status připravenosti.
- **AC-OFF-002 (navázáno na REQ-OFF-002):**
  - *Given* jakákoliv uživatelská akce (přidání místa, výdaj),
  - *When* je provedena,
  - *Then* se zapíše do lokální Drift DB s nulovou latencí (pod 16 ms).
- **AC-OFF-003 (navázáno na REQ-OFF-003):**
  - *Given* neodeslané změny v `sync_outbox`,
  - *When* je obnoveno připojení k síti,
  - *Then* Outbox Worker automaticky synchronizuje data do Firestore a Sync Center ukáže „Vše synchronizováno“.

### 2.18 Export, záloha a obnova
- **AC-BAK-001 (navázáno na REQ-BAK-001):**
  - *Given* exportovaný ZIP balíček na novém čistém telefonu,
  - *When* uživatel zvolí „Obnovit trip ze zálohy“,
  - *Then* se ověří integrita hashů a veškerá data (itinerář, místa, výdaje, doklady) se kompletně obnoví.

### 2.19 Maskot Haechi
- **AC-HCH-001 (navázáno na REQ-HCH-001):**
  - *Given* spuštění aplikace v deštivý den v Soulu,
  - *When* se načte Home,
  - *Then* Haechi zobrazí stav `rain` s krátkou lokální zprávou o deštníku bez volání externí AI.

---

## 3. Nefunkční akceptační kritéria (AC pro NFR-*)

- **AC-NFR-PERF (navázáno na NFR-PERF-001):**
  - *Given* lokální databáze Drift s 500 položkami,
  - *When* se načítá seznam míst nebo dnů,
  - *Then* je doba načtení pod 16 ms a animace probíhají plynule na 60 FPS.
- **AC-NFR-COST (navázáno na NFR-COST-001):**
  - *Given* provoz pro 4 uživatele,
  - *When* je aplikace v plném provozu,
  - *Then* žádná komponenta nevyžaduje platební kartu ani negeneruje účty za cloudové služby.
- **AC-NFR-SEC (navázáno na NFR-SEC-001):**
  - *Given* repozitář a klientská aplikace,
  - *When* je spuštěn audit kódu,
  - *Then* v repozitáři nejsou žádná hesla ani API klíče a citlivá data na disku jsou šifrována.
- **AC-NFR-A11Y (navázáno na NFR-A11Y-001):**
  - *Given* zapnuté systémové zvětšení textu na 150 %,
  - *When* uživatel prochází všechny obrazovky,
  - *Then* nedojde k žádnému RenderFlex přetečení a minimální dotyková plocha prvků je 48×48 dp.
- **AC-NFR-PLAT (navázáno na NFR-PLAT-001):**
  - *Given* verze pro Android a iOS,
  - *When* jsou prověřeny všechny funkce,
  - *Then* 100 % uživatelských funkcí funguje na obou mobilních platformách.
- **AC-NFR-RESIL (navázáno na NFR-RESIL-001):**
  - *Given* telefon s méně než 50 MB volného místa nebo poškozený soubor importu,
  - *When* nastane chyba,
  - *Then* aplikace nespadne, zobrazí bezpečné chybové hlášení a ochrání kritickou textovou DB.

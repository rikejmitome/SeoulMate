# SeoulMate v2.0 — Product Requirements Document (PRD)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Přehled a cíle produktu

SeoulMate v2.0 je soukromý, local-first a offline-first mobilní cestovní companion navržený pro skupinu čtyř rovnocenných přátel cestujících do Jižní Koreje. Aplikace sjednocuje plánování, navigaci, komunikaci, překlad, nouzové centrum, rozpočet, pamětní kroniku a zálohování do jednoho provázaného zážitku s nulovými provozními náklady.

Tento dokument definuje úplné funkční (`REQ-*`) a nefunkční (`NFR-*`) požadavky, které slouží jako závazné zadání pro vývojové agenty.

---

## 2. Funkční požadavky (Functional Requirements)

### 2.1 Jádro Tripu, členové a nastavení
- **REQ-TRIP-001 (P0):** Aplikace musí umožnit vytvoření, zobrazení, úpravu a archivaci soukromého tripu se zadaným názvem, termínem cesty (datum od–do), časovým pásmem (Asia/Seoul / Europe/Prague), výchozí měnou (KRW) a sekundární měnou (CZK/EUR).
- **REQ-TRIP-002 (P0):** Aplikace musí podporovat přesně 4 rovnocenné členy tripu s možností nastavení jména, avatara, osobních preferencí, alergií, dietních omezení a nouzových kontaktů.
- **REQ-TRIP-003 (P0):** Aplikace musí umožnit definici jedné či více „Home Base“ (ubytování) s korejským názvem, latinským přepisem, korejskou adresou, GPS souřadnicemi, kontakty, check-in/check-out časy a vazbou na rezervaci ve Vaultu.

### 2.2 Adaptivní Home („Co teď?“)
- **REQ-HOME-001 (P1):** Domovská obrazovka musí adaptivně zobrazovat dominantní kartu „Co teď?“ na základě fáze cesty (Dream/Adventure/Memories), aktuálního času, nejbližší aktivity a stavu připravenosti.
- **REQ-HOME-002 (P1):** Dominantní karta musí obsahovat srozumitelné zdůvodnění doporučení a přímé akční tlačítko (např. „Otevřít navigaci k hotelu“, „Zkontrolovat pasy“, „Doplnit zážitek dne“).
- **REQ-HOME-003 (P0):** Obrazovka musí obsahovat trvale dostupný rychlý přístup k Emergency Centru, Home Base Taxi kartě a viditelnému stavu synchronizace.

### 2.3 Plánovač cesty (Smart Itinerary)
- **REQ-PLAN-001 (P0):** Automatické vygenerování denních přehledů na základě zvoleného data od–do v tripu.
- **REQ-PLAN-002 (P0):** Možnost přidávat, upravovat, mazat a přesouvat aktivity v rámci dne i mezi jednotlivými dny s určením času, délky, místa, poznámek a účastníků.
- **REQ-PLAN-003 (P1):** Detekce časových konfliktů a překryvů mezi aktivitami s vizuálním varováním a doporučením úpravy časů.
- **REQ-PLAN-004 (P1):** Vysvětlitelné pravidlové návrhy Smart Itinerary (geografické seskupování aktivit, doporučená denní doba, délka návštěvy) s uvedením důvodu, míry jistoty, možností jednotlivého přijetí/odmítnutí a akcí Undo.
- **REQ-PLAN-005 (P0):** Možnost propojit aktivitu s konkrétním uloženým místem, dokumentem ve Vaultu nebo korejskou frází.

### 2.4 Místa a Group Decision Center (Places & Decisions)
- **REQ-PLC-001 (P0):** Databáze bodů zájmu s korejským i českým názvem, fotografií/ilustrací, kategorií, tagy, čtvrtí, otevírací dobou, cenovou hladinou a praktickými tipy.
- **REQ-PLC-002 (P0):** Hlasovací systém pro 4 členy (upvote / downvote / neutral) s okamžitým přepočtem pořadí oblíbenosti a možností označit místo jako oblíbené.
- **REQ-PLC-003 (P1):** Group Decision Center sjednocující neuzavřené volby skupiny: nerozhodná hlasování o místech, nepotvrzené časy a účastníky aktivit, návrhy změn v itineráři, rezervace vyžadující potvrzení a sporné výdaje.
- **REQ-PLC-004 (P0):** Možnost otevřít GPS souřadnice a korejský název místa v externí mapové aplikaci (Naver Map, KakaoMap, Google Maps).

### 2.5 Trip Inbox
- **REQ-INB-001 (P1):** Sběrné místo pro ukládání webových odkazů, sdíleného textu, screenshotů, fotografií, souborů, adres a rychlých poznámek.
- **REQ-INB-002 (P1):** Možnost manuálně klasifikovat položku z Inboxu na: Místo, Dokument/Rezervaci, Aktivitu, Ubytování, Výdaj, Poznámku nebo Položku checklistu při trvalém zachování původního surového vstupu.

### 2.6 Checklist a Readiness Center
- **REQ-CHK-001 (P0):** Společný i osobní seznam úkolů před cestou s kategoriemi, termíny, odpovědnou osobou, prioritami a opakovatelnými šablonami.
- **REQ-CHK-002 (P0):** Readiness Center vyhodnocující připravenost cesty (letenky, pasy, ubytování, doprava z letiště, nouzové info, finance, eSIM, úplnost itineráře a Offline Trip Pack) ve 4 stavech: Hotovo, Doporučeno, Důležité, Kritické.

### 2.7 Travel Vault (Bezpečné offline doklady)
- **REQ-VLT-001 (P0):** Ukládání letenek, boarding passů, voucherů ubytování, pojištění a vstupenek ve formátech PDF a obrázků.
- **REQ-VLT-002 (P0):** Veškeré soubory uložené ve Vaultu musí být uloženy v lokálním chráněném úložišti zařízení a 100% dostupné offline s evidencí stavu: lokální, sdílený, stažený offline.
- **REQ-VLT-003 (P0):** Citlivé lokální soubory a metadata musí být zabezpečeny platformními prostředky (šifrování na disku, ochrana biometrií/PINem).

### 2.8 Jazykový a kulturní průvodce (Korean Companion & Food Guide)
- **REQ-KOR-001 (P0):** Kurátorovaný offline balíček frází s korejským zápisem (Hangul), standardní romanizací, českou fonetickou výslovností, doslovným i přirozeným významem, situací, úrovní zdvořilosti, ověřeným audiem, oblíbenými položkami a historií.
- **REQ-KOR-002 (P0):** Encyklopedie korejských jídel s fotografiemi, hlavními surovinami, způsobem přípravy, pálivostí (0–3), běžnými alergeny, informacemi pro vegetariány, varováním před skrytými složkami (rybí/masový extrakt), způsobem objednání a souvisejícími frázemi.
- **REQ-KOR-003 (P1):** Celoobrazovkový režim „Show to Local“ pro zobrazení velkého korejského textu s vysokým kontrastem pro taxikáře, číšníka nebo policii.

### 2.9 Rychlé offline karty
- **REQ-CRD-001 (P1):** Sada rychle přístupných celoobrazovkových offline karet s korejským textem: Taxi Card (Home Base), Hotel Card, Allergy Card, Emergency Card, Today Card, Airport Card a Reservation Card.

### 2.10 Survival Guide a doprava
- **REQ-SRV-001 (P0):** Offline praktický průvodce: korejská etiketa a kulturní zvyklosti, peníze/směna/platby kartou, SIM/eSIM připojení, karta T-money, metro, autobusy, letištní doprava, číslování východů, poslední spoje a základní plán linek/stanic.

### 2.11 Camera Companion (On-device OCR a lokální překlad)
- **REQ-CAM-001 (P1):** Načtení obrazu z kamery nebo galerie s on-device rozpoznáním korejského textu pomocí Google ML Kit.
- **REQ-CAM-002 (P1):** Lokální strojový překlad rozpoznaného textu s možností výběru, kopírování, uložení a automatického porovnání s ověřenou databází jídel a frází.
- **REQ-CAM-003 (P1):** Výsledky automatického rozpoznání a překladu musí být zřetelně označeny jako neověřený strojový výstup a uživatel musí mít přístup k původnímu textu.

### 2.12 Emergency Center
- **REQ-EMG-001 (P0):** Okamžitý přístup k tísňovým linkám (112 Policie, 119 Hasiči/Záchranka, 1330 Turistická linka) a kontaktům na Velvyslanectví ČR v Soulu s informací o datu poslední aktualizace obsahu.
- **REQ-EMG-002 (P0):** Zobrazení nouzové kartičky Home Base v Hangulu s adresou a mapou bez nutnosti internetového připojení.
- **REQ-EMG-003 (P0):** Přehled zdravotních údajů, krevních skupin, závažných alergií a kontaktů na blízké osoby pro všechny 4 členy tripu.

### 2.13 Rozpočet a výdaje (Budget)
- **REQ-BDG-001 (P0):** Evidence výdajů ve více měnách (KRW, CZK, EUR) s přepočtem, plátcem, účastníky, kategoriemi a poznámkami.
- **REQ-BDG-002 (P0):** Možnost rovného rozdělení (split 1/4) i vlastních podílů s automatickým výpočtem zůstatků a návrhem minimálního počtu plateb pro vyrovnání dluhů a možností exportu.
- **REQ-BDG-003 (P1):** Fotografie účtenky a on-device OCR návrh částky, měny, data a obchodníka s povinným ručním potvrzením před uložením.

### 2.14 Mapy (Online & Offline Map Lite)
- **REQ-MAP-001 (P1):** Online mapa zobrazující Home Base, uložená místa, dnešní aktivity, polohu uživatele a denní spojnice; Offline Map Lite zobrazující uložené body, Home Base, pořadí aktivit a přibližné směry/vzdálenosti bez nutnosti dlaždic třetích stran.

### 2.15 Počasí
- **REQ-WTH-001 (P1):** Volitelný online doplněk předpovědi počasí (Open-Meteo API) s časem poslední aktualizace, vysvětlitelnými doporučeními pro itinerář a bezpečným výpadkem (chyba počasí nesmí narušit chod aplikace).

### 2.16 Memories, deník a statistiky
- **REQ-MEM-001 (P0):** Denní kronika propojující dokončené aktivity, navštívená místa a společné i osobní poznámky.
- **REQ-MEM-002 (P0):** Ukládání vybraných fotografií do lokálního alba s generováním optimalizovaných miniatur a zachováním odkazů na originály.
- **REQ-MEM-003 (P1):** Generování a export uceleného tisknutelného PDF Trip Booku s časovou osou, místy, fotkami a statistikami přímo na mobilním telefonu.
- **REQ-MEM-004 (P1):** Automaticky připravená kostra deníku k doplnění a přehled cestovních statistik a achievementů.

### 2.17 Offline Trip Pack a Synchronizace
- **REQ-OFF-001 (P0):** Stažení a kontrola Offline Trip Packu s přehledným manifestem (položky, velikost, verze, stáří, integrita, chyby stahování).
- **REQ-OFF-002 (P0):** Local-First architektura: veškeré čtení i zápis probíhají okamžitě do lokální Drift SQLite databáze.
- **REQ-OFF-003 (P0):** Asynchronní synchronizace přes Outbox frontu do Cloud Firestore s přehledným Sync Centrem, diagnostikou a deterministickým řešením konfliktů.

### 2.18 Export, záloha a obnova
- **REQ-BAK-001 (P0):** Kompletní export strukturovaných dat a souborů do přenosného šifrovaného ZIP balíčku s kontrolou integrity a možností úplné obnovy tripu na novém zařízení.

### 2.19 Maskot Haechi
- **REQ-HCH-001 (P1):** Lokální pravidlový stavový systém maskota Haechi s 11 definovanými stavy (welcome, preparation, cheer, warning, travel, rain, offline, sync_error, day_completed, achievement, homecoming) a kontextovými šablonami bez placené AI.

---

## 3. Nefunkční požadavky (Non-Functional Requirements)

- **NFR-PERF-001:** Okamžitá odezva UI (čtení z lokální databáze do 16 ms / 60 FPS).
- **NFR-COST-001:** Přísná shoda se Zero-Cost Gate (0 Kč provozní náklady pro 4 uživatele, zákaz služeb vyžadujících platební kartu).
- **NFR-SEC-001:** Žádné API klíče ani tajné údaje v repozitáři; hardwarově šifrované lokální úložiště klíčů; zákaz logování PII.
- **NFR-A11Y-001:** Podpora dynamického zvětšení systémového textu do 150 %, kontrast minimálně 4.5:1, touch target minimálně 48×48 dp.
- **NFR-PLAT-001:** 100% funkční pokrytí všech schopností na platformách Android a iOS; desktop (Windows/macOS) veden jako sekundární P2 companion bez exkluzivních funkcí.
- **NFR-RESIL-001:** Odolnost systému při nedostatku úložného prostoru, poškozeném importu zálohy a bezpečná degradace všech externích služeb bez pádu aplikace.
